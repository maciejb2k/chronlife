# == Schema Information
#
# Table name: disease_symptoms
#
#  id                    :uuid             not null, primary key
#  description           :text             default(""), not null
#  first_noticed_at      :date
#  name                  :string           default(""), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  disease_id            :uuid             not null
#  predefined_symptom_id :uuid
#
# Indexes
#
#  index_disease_symptoms_on_disease_id                            (disease_id)
#  index_disease_symptoms_on_disease_id_and_predefined_symptom_id  (disease_id,predefined_symptom_id)
#  index_disease_symptoms_on_predefined_symptom_id                 (predefined_symptom_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#  fk_rails_...  (predefined_symptom_id => predefined_symptoms.id)
#
class DiseaseSymptom < ApplicationRecord
  belongs_to :disease
  belongs_to :predefined_symptom, optional: true

  has_many :updates, class_name: "DiseaseSymptomUpdate", dependent: :destroy

  validates :description, length: { maximum: 500 }, presence: true
  validates :first_noticed_at, allow_blank: true,
                               timeliness: { on_or_before: -> { Time.zone.now }, type: :date }
  validates :name, length: { maximum: 100 }, if: -> { name.present? }
  validates :predefined_symptom_id, presence: true,
                                    uniqueness: {
                                      scope: :disease_id,
                                      message: "objaw już został dodany do tej choroby"
                                    },
                                    if: -> { predefined_symptom_id.present? }

  validate :only_one_field_set

  private

  def only_one_field_set
    if predefined_symptom_id.blank? && name.blank?
      errors.add(:predefined_symptom_id, "wybierz z listy albo podaj własną nazwę objawu")
    elsif predefined_symptom_id.present? && name.present?
      errors.add(:predefined_symptom_id, "tylko jedno pole może być wypełnione")
    end
  end
end
