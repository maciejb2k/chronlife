# == Schema Information
#
# Table name: article_tags
#
#  id         :uuid             not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ArticleTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
