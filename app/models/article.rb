# == Schema Information
#
# Table name: articles
#
#  id          :uuid             not null, primary key
#  body        :text             default(""), not null
#  description :string           default(""), not null
#  title       :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :uuid             not null
#
# Indexes
#
#  index_articles_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Article < ApplicationRecord
  belongs_to :account

  has_and_belongs_to_many :article_tags

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 5000 }
  validates :description, length: { maximum: 200 }, allow_blank: true
end
