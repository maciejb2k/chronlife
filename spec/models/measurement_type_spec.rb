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
require 'rails_helper'

RSpec.describe MeasurementType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
