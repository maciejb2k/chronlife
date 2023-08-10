# == Schema Information
#
# Table name: reactions
#
#  id             :uuid             not null, primary key
#  reactable_type :string           not null
#  reaction_type  :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :uuid             not null
#  reactable_id   :uuid             not null
#
# Indexes
#
#  index_reactions_on_account_id  (account_id)
#  index_reactions_on_reactable   (reactable_type,reactable_id)
#  index_unique_user_reactable    (account_id,reactable_id,reactable_type) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Reaction < ApplicationRecord
  belongs_to :reactable, polymorphic: true
  belongs_to :account

  TYPES = %w[like dislike haha love sad angry].freeze

  validates :reaction_type, presence: true, inclusion: { in: TYPES }
  validates :account_id, uniqueness: { scope: %i[reactable_id reactable_type] }

  def like?
    type == "like"
  end

  def dislike?
    type == "dislike"
  end

  def haha?
    type == "haha"
  end

  def love?
    type == "love"
  end

  def sad?
    type == "sad"
  end

  def angry?
    type == "angry"
  end
end
