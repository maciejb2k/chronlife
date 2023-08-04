# == Schema Information
#
# Table name: measurement_types
#
#  id          :uuid             not null, primary key
#  lower_limit :decimal(, )
#  name        :string           default(""), not null
#  upper_limit :decimal(, )
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
class MeasurementType < ApplicationRecord
  has_many :measurements, dependent: :destroy
  belongs_to :unit
end
