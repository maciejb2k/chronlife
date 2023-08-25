# == Schema Information
#
# Table name: treatments
#
#  id            :uuid             not null, primary key
#  description   :text             default(""), not null
#  effectiveness :integer          default(0), not null
#  end_date      :date
#  is_finished   :boolean          default(FALSE), not null
#  start_date    :date
#  title         :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :uuid             not null
#
# Indexes
#
#  index_treatments_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
FactoryBot.define do
  factory :treatment do
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    start_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    effectiveness { rand(1..5) }
    account
  end
end
