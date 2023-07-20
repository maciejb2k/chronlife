# == Schema Information
#
# Table name: treatment_diseases
#
#  id           :uuid             not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  disease_id   :uuid             not null
#  treatment_id :uuid             not null
#
# Indexes
#
#  index_treatment_diseases_on_disease_id                   (disease_id)
#  index_treatment_diseases_on_treatment_id                 (treatment_id)
#  index_treatment_diseases_on_treatment_id_and_disease_id  (treatment_id,disease_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#  fk_rails_...  (treatment_id => treatments.id)
#
require 'rails_helper'

RSpec.describe TreatmentDisease, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
