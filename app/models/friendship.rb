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
class Friendship < ApplicationRecord
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  belongs_to :account
  belongs_to :friend, class_name: "Account"

  validates :account_id, uniqueness: { scope: :friend_id }
  validate :not_self

  private

  def create_inverse_relationship
    friend.friendships.create(friend: account)
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: account)
    friendship&.destroy
  end

  def not_self
    errors.add(:friend, "can't be equal to user") if account == friend
  end
end
