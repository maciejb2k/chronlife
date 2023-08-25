# == Schema Information
#
# Table name: friend_requests
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#  friend_id  :uuid             not null
#
# Indexes
#
#  index_friend_requests_on_account_id  (account_id)
#  index_friend_requests_on_friend_id   (friend_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (friend_id => accounts.id)
#
require "rails_helper"

RSpec.describe FriendRequest, type: :model do
  describe "account wants to be friends with friend" do
    context "when they did not send a friend request to each other" do
      let_it_be(:account) { create(:account) }
      let_it_be(:friend) { create(:account) }
      let_it_be(:friend_request) { create(:friend_request, account:, friend:) }

      it "is valid" do
        expect(friend_request).to be_valid
      end
    end

    context "when account sent a friend request to friend" do
      let_it_be(:account) { create(:account) }
      let_it_be(:friend) { create(:account) }
      let_it_be(:friend_request) { create(:friend_request, account:, friend:) }
      let(:new_friend_request) { create(:friend_request, account:, friend:) }

      it "is invalid" do
        expect { new_friend_request }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "when account is already friends with friend" do
      let_it_be(:account) { create(:account) }
      let_it_be(:friend) { create(:account) }
      let_it_be(:friend_request) { create(:friend_request, account:, friend:) }

      before do
        account.friends << friend
      end

      it "is invalid" do
        expect(friend_request).not_to be_valid
        expect(friend_request.errors[:friend].size).to eq 1
        expect(friend_request.errors[:friend]).to(
          include I18n.t("activerecord.errors.models.friend_request.already_friend")
        )
      end
    end

    context "when friend already sent a friend request to account" do
      let_it_be(:account) { create(:account) }
      let_it_be(:friend) { create(:account) }
      let_it_be(:pending_friend_request) do
        create(:friend_request, account: friend, friend: account)
      end
      let_it_be(:friend_request) { create(:friend_request, account:, friend:) }

      it "is invalid" do
        expect(friend_request).to be_valid
      end
    end

    context "when account wants to send a friend request to itself" do
      let_it_be(:account) { create(:account) }
      let_it_be(:friend) { account }
      let_it_be(:friend_request) { build(:friend_request, account:, friend:) }

      it "is invalid" do
        expect(friend_request).not_to be_valid
        expect(friend_request.errors[:friend].size).to eq 1
        expect(friend_request.errors[:friend]).to(
          include I18n.t("activerecord.errors.models.friend_request.cannot_send_to_yourself")
        )
      end
    end
  end

  describe "#accept" do
    let_it_be(:account) { create(:account) }
    let_it_be(:friend) { create(:account) }
    let_it_be(:friend_request) { create(:friend_request, account:, friend:) }

    it "adds friend to account friends" do
      expect { friend_request.accept }.to(
        change { account.friends.count }
        .by(1).and(change(described_class, :count).by(-1))
      )
    end
  end
end
