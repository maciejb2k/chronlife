# == Schema Information
#
# Table name: disease_risk_factors
#
#  id          :uuid             not null, primary key
#  description :text             default(""), not null
#  name        :string           default(""), not null
#  severity    :integer          default(1), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  disease_id  :uuid             not null
#
# Indexes
#
#  index_disease_risk_factors_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#
class DiseaseRiskFactor < ApplicationRecord
  belongs_to :disease, inverse_of: :risk_factors

  validates :name, length: { maximum: 100 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true
  validates :severity, presence: true,
                       numericality: {
                         only_integer: true,
                         greater_than_or_equal_to: 1,
                         less_than_or_equal_to: 5
                       }
end
