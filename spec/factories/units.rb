# == Schema Information
#
# Table name: units
#
#  id          :uuid             not null, primary key
#  description :string           default(""), not null
#  name        :string           default(""), not null
#  symbol      :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_units_on_symbol  (symbol) UNIQUE
#
FactoryBot.define do
  factory :unit do
    name { Faker::Alphanumeric.alphanumeric(number: 16) }
    description { Faker::Lorem.paragraph }
    symbol { Faker::Alphanumeric.alphanumeric(number: 8) }

    trait :kg do
      name { "Kilogram" }
      description { "Kilogram" }
      symbol { "kg" }
    end

    trait :bpm do
      name { "Beats per minute" }
      description { "Beats per minute" }
      symbol { "bpm" }
    end

    trait :mmhg do
      name { "Millimeter of mercury" }
      description { "Millimeter of mercury" }
      symbol { "mmHg" }
    end

    trait :mgdl do
      name { "Milligram per deciliter" }
      description { "Milligram per deciliter" }
      symbol { "mg/dl" }
    end

    trait :percent do
      name { "Percent" }
      description { "Percent" }
      symbol { "%" }
    end
  end
end
