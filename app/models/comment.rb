# == Schema Information
#
# Table name: comments
#
#  id               :uuid             not null, primary key
#  body             :text             default(""), not null
#  commentable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :uuid             not null
#  commentable_id   :uuid             not null
#
# Indexes
#
#  index_comments_on_account_id   (account_id)
#  index_comments_on_commentable  (commentable_type,commentable_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :account

  validates :body, presence: true, length: { maximum: 500 }
end
