# == Schema Information
#
# Table name: article_tags
#
#  id         :uuid             not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArticleTag < ApplicationRecord
  has_and_belongs_to_many :articles
end
