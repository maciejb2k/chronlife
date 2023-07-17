# == Schema Information
#
# Table name: disease_symptom_updates
#
#  id                 :uuid             not null, primary key
#  intensity          :integer          default(0), not null
#  update_date        :date             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  disease_symptom_id :uuid             not null
#
# Indexes
#
#  index_disease_symptom_updates_on_disease_symptom_id  (disease_symptom_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_symptom_id => disease_symptoms.id)
#
class DiseaseSymptomUpdate < ApplicationRecord
  belongs_to :disease_symptom
end
