# == Schema Information
#
# Table name: predefined_diseases
#
#  id            :uuid             not null, primary key
#  description   :text             default(""), not null
#  icd10_code    :string           default(""), not null
#  name          :string           default(""), not null
#  related_names :string           default([]), is an Array
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_predefined_diseases_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :predefined_disease do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end
end
