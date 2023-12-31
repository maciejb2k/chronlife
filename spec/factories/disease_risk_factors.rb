# == Schema Information
#
# Table name: disease_risk_factors
#
#  id          :uuid             not null, primary key
#  description :text             default(""), not null
#  name        :string           default(""), not null
#  severity    :integer          default(1), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  disease_id  :uuid             not null
#
# Indexes
#
#  index_disease_risk_factors_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#
FactoryBot.define do
  factory :disease_risk_factor do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph_by_chars(number: 100) }
    severity { rand(1..5) }
    disease
  end
end
