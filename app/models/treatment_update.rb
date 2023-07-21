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
class TreatmentUpdate < ApplicationRecord
  belongs_to :treatment, inverse_of: :updates

  STATUSES = %w[improvement no_change worsening].freeze

  validates :name, length: { maximum: 100 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :update_date, presence: true,
                          timeliness: { on_or_before: -> { Time.zone.now }, type: :date }

  def improvement?
    status == "improvement"
  end

  def no_change?
    status == "no_change"
  end

  def worsening?
    status == "worsening"
  end
end
