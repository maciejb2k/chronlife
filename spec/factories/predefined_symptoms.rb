# == Schema Information
#
# Table name: predefined_symptoms
#
#  id                    :uuid             not null, primary key
#  description           :text             default(""), not null
#  name                  :string           default(""), not null
#  related_names         :string           default([]), is an Array
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  predefined_disease_id :uuid             not null
#
# Indexes
#
#  index_predefined_symptoms_on_name                   (name) UNIQUE
#  index_predefined_symptoms_on_predefined_disease_id  (predefined_disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (predefined_disease_id => predefined_diseases.id)
#
FactoryBot.define do
  factory :predefined_symptom do
    name { Faker::Alphanumeric.alphanumeric(number: 32) }
    description { Faker::Lorem.paragraph }
    predefined_disease
  end
end
