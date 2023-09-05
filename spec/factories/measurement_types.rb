# == Schema Information
#
# Table name: measurement_types
#
#  id          :uuid             not null, primary key
#  lower_limit :string           default(""), not null
#  name        :string           default(""), not null
#  upper_limit :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  unit_id     :uuid             not null
#
# Indexes
#
#  index_measurement_types_on_unit_id  (unit_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_id => units.id)
#
FactoryBot.define do
  factory :measurement_type do
    name { Faker::Alphanumeric.alphanumeric(number: 32) }
    unit

    factory :weight_measurement_type do
      name { "weight" }
      unit factory: %i[unit kg]
    end

    factory :sugar_measurement_type do
      name { "sugar" }
      lower_limit { 70 }
      upper_limit { 99 }
      unit factory: %i[unit mgdl]
    end

    factory :heart_rate_measurement_type do
      name { "heart_rate" }
      lower_limit { 60 }
      upper_limit { 100 }
      unit factory: %i[unit bpm]
    end

    factory :blood_pressure_measurement_type do
      name { "blood_pressure" }
      lower_limit { "100/60" }
      upper_limit { "139/89" }
      unit factory: %i[unit mmhg]
    end

    factory :spo2_measurement_type do
      name { "spo2" }
      lower_limit { 90 }
      upper_limit { 100 }
      unit factory: %i[unit percent]
    end
  end
end
