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
  belongs_to :symptom, class_name: "DiseaseSymptom", inverse_of: :updates,
                       foreign_key: :disease_symptom_id

  validates :intensity, presence: true,
                        numericality: {
                          only_integer: true,
                          greater_than_or_equal_to: 0,
                          less_than_or_equal_to: 5
                        }
  validates :update_date, presence: true,
                          timeliness: { on_or_before: -> { Time.zone.now }, type: :date }
end
