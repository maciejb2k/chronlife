# == Schema Information
#
# Table name: accounts
#
#  id           :uuid             not null, primary key
#  bio          :text             default(""), not null
#  birthday     :date
#  city         :string           default(""), not null
#  country      :string           default(""), not null
#  education    :string           default(""), not null
#  first_name   :string           default(""), not null
#  image_data   :text
#  is_verified  :boolean          default(FALSE), not null
#  last_name    :string           default(""), not null
#  phone_number :string           default(""), not null
#  settings     :jsonb            not null
#  sex          :string           default(""), not null
#  username     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :uuid             not null
#
# Indexes
#
#  index_accounts_on_settings  (settings) USING gin
#  index_accounts_on_user_id   (user_id)
#  index_accounts_on_username  (username) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Account, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:friend_requests).dependent(:destroy) }

    it do
      is_expected.to have_many(:sent_friend_requests)
        .class_name("FriendRequest")
        .dependent(:destroy)
    end

    it do
      is_expected.to have_many(:received_friend_requests)
        .class_name("FriendRequest")
        .with_foreign_key(:friend_id)
        .dependent(:destroy)
        .inverse_of(:friend)
    end

    it { is_expected.to have_many(:friendships).dependent(:destroy) }
    it { is_expected.to have_many(:friends).through(:friendships) }

    it { is_expected.to have_many(:group_members).dependent(:destroy) }
    it { is_expected.to have_many(:groups).through(:group_members) }
    it { is_expected.to have_many(:group_posts).dependent(:destroy) }

    it { is_expected.to have_many(:diseases).dependent(:destroy) }
    it { is_expected.to have_many(:treatments).dependent(:destroy) }
    it { is_expected.to have_many(:notes).dependent(:destroy) }
    it { is_expected.to have_many(:note_groups).dependent(:destroy) }
    it { is_expected.to have_many(:note_tags).dependent(:destroy) }
    it { is_expected.to have_many(:measurements).dependent(:destroy) }

    it { is_expected.to have_many(:specialist_requests).dependent(:destroy) }
    it { is_expected.to have_many(:articles).dependent(:destroy) }
  end

  describe "validations" do
    describe "first_name" do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_length_of(:first_name).is_at_most(32) }
    end

    describe "last_name" do
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_length_of(:last_name).is_at_most(32) }
    end

    describe "username" do
      subject { build(:account) }

      it { is_expected.to validate_presence_of(:username) }
      it { is_expected.to validate_uniqueness_of(:username) }
      it { is_expected.to validate_length_of(:username).is_at_most(50) }
    end

    describe "bio" do
      it { is_expected.to validate_length_of(:bio).is_at_most(100) }
      it { is_expected.to allow_value("", nil).for(:bio) }
    end

    describe "sex" do
      it { is_expected.to validate_inclusion_of(:sex).in_array(Account::SEX_OPTIONS) }
      it { is_expected.to allow_value("", nil).for(:sex) }
    end

    describe "birthday" do
      it { is_expected.to allow_value(3.years.ago).for(:birthday) }
      it { is_expected.to allow_value(100.years.ago).for(:birthday) }

      it { is_expected.not_to allow_value(2.years.ago).for(:birthday) }
      it { is_expected.not_to allow_value(101.years.ago).for(:birthday) }

      it { is_expected.to allow_value("", nil).for(:birthday) }
    end

    describe "country" do
      it { is_expected.to validate_length_of(:country).is_at_most(50) }
      it { is_expected.to allow_value("", nil).for(:country) }
    end

    describe "city" do
      it { is_expected.to validate_length_of(:city).is_at_most(50) }
      it { is_expected.to allow_value("", nil).for(:city) }
    end

    describe "phone_number" do
      it { is_expected.to allow_value("", nil).for(:phone_number) }
      it { is_expected.to allow_value("123456789").for(:phone_number) }
      it { is_expected.to allow_value("+48 123 456 789").for(:phone_number) }

      it { is_expected.not_to allow_value("+12 000 000 000").for(:phone_number) }
      it { is_expected.not_to allow_value("123").for(:phone_number) }
      it { is_expected.not_to allow_value("asdasd").for(:phone_number) }
    end

    describe "education" do
      it { is_expected.to validate_inclusion_of(:education).in_array(Account::EDUCATION_OPTIONS) }
      it { is_expected.to allow_value("", nil).for(:education) }
    end
  end

  describe "methods" do
    describe "#full_name" do
      let_it_be(:account) { create(:account) }

      it "returns the full name" do
        expect(account.full_name).to eq("#{account.first_name} #{account.last_name}")
      end
    end

    describe "#account_incomplete?" do
      context "when the account is incomplete" do
        let_it_be(:account) { build(:account, :incomplete) }

        it "returns true" do
          expect(account.account_incomplete?).to be true
        end
      end

      context "when the account is complete" do
        let_it_be(:account) { build(:account) }

        it "returns false" do
          expect(account.account_incomplete?).to be false
        end
      end
    end
  end

  describe "friends" do
    describe "#all_friend_requests" do
      let_it_be(:account) { create(:account) }

      context "when there are no friend requests" do
        it "returns an empty array" do
          expect(account.all_friend_requests).to eq([])
        end
      end

      context "when there are friend requests" do
        let_it_be(:friend) { create(:account) }
        let_it_be(:friend_request) { create(:friend_request, account:, friend:) }

        it "returns all friend requests" do
          expect(account.all_friend_requests).to eq([friend_request])
          expect(account.all_friend_requests.size).to eq 1
        end
      end
    end

    describe "#friend?" do
      let_it_be(:account) { create(:account) }
      let_it_be(:friend) { create(:account) }

      context "when the accounts are not friends" do
        it "returns false" do
          expect(account.friend?(friend)).to be false
          expect(friend.friend?(account)).to be false
        end
      end

      context "when the accounts are friends" do
        let_it_be(:friendship) { create(:friendship, account:, friend:) }

        it "returns true" do
          expect(account.friend?(friend)).to be true
          expect(friend.friend?(account)).to be true
        end
      end
    end

    describe "#friend_request_sent?" do
      let_it_be(:account) { create(:account) }
      let_it_be(:friend) { create(:account) }

      context "when the account has not sent a friend request" do
        it "returns false" do
          expect(account.friend_request_sent?(friend)).to be false
        end
      end

      context "when the account has sent a friend request" do
        let_it_be(:friend_request) { create(:friend_request, account:, friend:) }

        it "returns true" do
          expect(account.friend_request_sent?(friend)).to be true
          expect(friend.friend_request_sent?(account)).to be false
        end
      end
    end

    describe "#friend_request_received?" do
      let_it_be(:account) { create(:account) }
      let_it_be(:friend) { create(:account) }

      context "when the account has not received a friend request" do
        it "returns false" do
          expect(account.friend_request_received?(friend)).to be false
        end
      end

      context "when the account has received a friend request" do
        let_it_be(:friend_request) { create(:friend_request, account:, friend:) }

        it "returns true" do
          expect(account.friend_request_received?(friend)).to be false
          expect(friend.friend_request_received?(account)).to be true
        end
      end
    end
  end
end
