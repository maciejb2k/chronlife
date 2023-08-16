# == Schema Information
#
# Table name: measurements
#
#  id                  :uuid             not null, primary key
#  is_norm_exceeded    :boolean          default(FALSE), not null
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
class Measurement < ApplicationRecord
  belongs_to :account
  belongs_to :measurement_type

  TYPES = %i[weight heart_beat blood_pressure sugar spo2].freeze

  validates :value, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 3, less_than_or_equal_to: 300 },
                    on: :measurement_weight
  validates :value, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 220 },
                    on: :measurement_heart_beat
  validates :value, format: { with: /\A\d{1,3}\/\d{1,3}\z/, message: "powinno być w formacie 120/80" },
                    on: :measurement_blood_pressure
  validates :value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 },
                    on: :measurement_sugar
  validates :value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
                    on: :measurement_spo2

  validates :measurement_date, presence: true,
                               timeliness: { on_or_before: -> { Time.zone.now }, type: :datetime }
end
