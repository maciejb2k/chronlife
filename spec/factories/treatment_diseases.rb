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
FactoryBot.define do
  factory :treatment_disease do
    treatment { nil }
    disease { nil }
  end
end
