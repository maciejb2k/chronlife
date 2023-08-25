# == Schema Information
#
# Table name: measurements
#
#  id                  :uuid             not null, primary key
#  is_within_limits    :boolean          default(TRUE), not null
#  measurement_date    :datetime         not null
#  value               :string           default("0.0"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  account_id          :uuid             not null
#  measurement_type_id :uuid             not null
#
# Indexes
#
#  index_measurements_on_account_id           (account_id)
#  index_measurements_on_measurement_type_id  (measurement_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (measurement_type_id => measurement_types.id)
#
FactoryBot.define do
  factory :measurement do
    measurement_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    measurement_type
    account

    weight

    trait :weight do
      # violates unique index, because of the seeded data
      # measurement_type factory: :weight_measurement_type
      measurement_type { MeasurementType.find_by(name: "weight") }
      value { rand(30..150) }
    end

    trait :sugar do
      # measurement_type factory: :sugar_measurement_type
      measurement_type { MeasurementType.find_by(name: "sugar") }
      value { rand(70..99) }
    end

    trait :heart_beat do
      # measurement_type factory: :heart_rate_measurement_type
      measurement_type { MeasurementType.find_by(name: "heart_beat") }
      value { rand(60..100) }
    end

    trait :blood_pressure do
      # measurement_type factory: :blood_pressure_measurement_type
      measurement_type { MeasurementType.find_by(name: "blood_pressure") }
      value { "#{rand(110..130)}/#{rand(60..80)}" }
    end

    trait :spo2 do
      # measurement_type factory: :spo2_measurement_type
      measurement_type { MeasurementType.find_by(name: "spo2") }
      value { rand(90..100) }
    end
  end
end
