# == Schema Information
#
# Table name: measurements
#
#  id                  :uuid             not null, primary key
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
require 'rails_helper'

RSpec.describe Measurement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
