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
