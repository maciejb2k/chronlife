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
class Measurement < ApplicationRecord
  before_create :check_limits
  before_update :check_limits

  belongs_to :account
  belongs_to :measurement_type

  TYPES = %i[weight heart_beat blood_pressure sugar spo2].freeze

  validates :value, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 300 },
                    on: :measurement_weight
  validates :value, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 220 },
                    on: :measurement_heart_beat
  validates :value, format: {
                      with: %r{\A\d{1,3}/\d{1,3}\z},
                      message: :invalid_measurement_blood_pressure
                    },
                    on: :measurement_blood_pressure
  validates :value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 },
                    on: :measurement_sugar
  validates :value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
                    on: :measurement_spo2

  validates :measurement_date, presence: true,
                               timeliness: { on_or_before: -> { Time.zone.now }, type: :datetime }

  def check_limits
    current_value = value
    lower_limit = measurement_type.lower_limit
    upper_limit = measurement_type.upper_limit

    self.is_within_limits =
      case measurement_type.name.to_sym
      when :blood_pressure
        blood_pressure_within_limits? current_value, lower_limit, upper_limit
      when :heart_beat, :sugar, :spo2
        within_limits? current_value.to_f, lower_limit.to_f, upper_limit.to_f
      else
        true
      end
  end

  def blood_pressure_within_limits?(value, lower_limit, upper_limit)
    systolic_current, diastolic_current = parse_blood_pressure value
    systolic_lower, diastolic_lower = parse_blood_pressure lower_limit
    systolic_upper, diastolic_upper = parse_blood_pressure upper_limit

    within_limits?(systolic_current, systolic_lower, systolic_upper) &&
      within_limits?(diastolic_current, diastolic_lower, diastolic_upper)
  end

  def within_limits?(value, lower_limit, upper_limit)
    value >= lower_limit && value <= upper_limit
  end

  def parse_blood_pressure(input)
    systolic, diastolic = input.split("/").map(&:to_f)
    [systolic, diastolic]
  end
end
