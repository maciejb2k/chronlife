# == Schema Information
#
# Table name: friendships
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#  friend_id  :uuid             not null
#
# Indexes
#
#  index_friendships_on_account_id  (account_id)
#  index_friendships_on_friend_id   (friend_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (friend_id => accounts.id)
#
require "rails_helper"

RSpec.describe Friendship, type: :model do
  describe "factory" do
    subject { build(:friendship, account: create(:account), friend: create(:account)) }

    it { is_expected.to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:friend).class_name("Account") }
  end

  describe "validations" do
    describe "account_id" do
      subject { build(:friendship, account: create(:account), friend: create(:account)) }

      it do
        is_expected.to(
          validate_uniqueness_of(:account_id).scoped_to(:friend_id)
          .case_insensitive.with_message(:taken)
        )
      end
    end
  end

  context "when account is equal to friend" do
    let(:account) { create(:account) }
    let(:friend) { account }
    let(:friendship) { build(:friendship, account:, friend:) }

    it "is invalid" do
      expect(friendship).not_to be_valid
      expect(friendship.errors[:friend]).to(
        include I18n.t("activerecord.errors.models.friendship.cannot_friend_yourself")
      )
    end
  end

  context "when friendship is created" do
    let(:account) { create(:account) }
    let(:friend) { create(:account) }

    it "creates inverse relationship" do
      expect { create(:friendship, account:, friend:) }.to change(described_class, :count).by(2)
      expect(account.friends).to include(friend)
      expect(friend.friends).to include(account)
    end
  end

  context "when friendship is destroyed" do
    let(:account) { create(:account) }
    let(:friend) { create(:account) }

    before { create(:friendship, account:, friend:) }

    it "destroys inverse relationship" do
      expect { account.friendships.first.destroy }.to change(described_class, :count).by(-2)
      expect(account.friends).not_to include(friend)
      expect(friend.friends).not_to include(account)
    end
  end
end
