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
FactoryBot.define do
  factory :article do
    titile { "MyString" }
    body { "MyText" }
    account { nil }
  end
end
