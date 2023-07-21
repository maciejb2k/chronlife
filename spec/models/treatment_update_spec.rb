# == Schema Information
#
# Table name: treatment_updates
#
#  id           :uuid             not null, primary key
#  description  :text             default(""), not null
#  name         :string           default(""), not null
#  status       :string           default(""), not null
#  update_date  :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  treatment_id :uuid             not null
#
# Indexes
#
#  index_treatment_updates_on_treatment_id  (treatment_id)
#
# Foreign Keys
#
#  fk_rails_...  (treatment_id => treatments.id)
#
require 'rails_helper'

RSpec.describe TreatmentUpdate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
