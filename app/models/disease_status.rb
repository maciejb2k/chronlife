# == Schema Information
#
# Table name: disease_statuses
#
#  id         :uuid             not null, primary key
#  content    :text             default(""), not null
#  mood       :integer          default(3), not null
#  status     :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  disease_id :uuid             not null
#
# Indexes
#
#  index_disease_statuses_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#
class DiseaseStatus < ApplicationRecord
  belongs_to :disease, inverse_of: :statuses

  STATUSES = %w[diagnosed suspicion deterioration significant_deterioration
                improvement significant_improvement cured relapsed].freeze

  validates :content, presence: true, length: { maximum: 500 }
  validates :mood, presence: true,
                   numericality: {
                     only_integer: true,
                     greater_than_or_equal_to: 1,
                     less_than_or_equal_to: 3
                   }
  validates :status, presence: true, inclusion: { in: STATUSES }

  def diagnosed?
    status == "diagnosed"
  end

  def suspicion?
    status == "suspicion"
  end

  def deterioration?
    status == "deterioration"
  end

  def significant_deterioration?
    status == "significant_deterioration"
  end

  def improvement?
    status == "improvement"
  end

  def significant_improvement?
    status == "significant_improvement"
  end

  def cured?
    status == "cured"
  end

  def relapsed?
    status == "relapsed"
  end
end
