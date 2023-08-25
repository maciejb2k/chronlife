# == Schema Information
#
# Table name: treatments
#
#  id            :uuid             not null, primary key
#  description   :text             default(""), not null
#  effectiveness :integer          default(0), not null
#  end_date      :date
#  is_finished   :boolean          default(FALSE), not null
#  start_date    :date
#  title         :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :uuid             not null
#
# Indexes
#
#  index_treatments_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Treatment < ApplicationRecord
  belongs_to :account

  has_many :updates, class_name: "TreatmentUpdate", inverse_of: :treatment, dependent: :destroy

  has_many :treatment_diseases, dependent: :destroy
  has_many :diseases, through: :treatment_diseases

  validates :title, length: { maximum: 100 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true
  validates :effectiveness, presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than_or_equal_to: 1,
                              less_than_or_equal_to: 5
                            }
  validates :start_date, presence: true,
                         timeliness: { on_or_before: -> { Time.zone.now }, type: :date }
  validates :end_date, timeliness: {
                         on_or_after: :start_date,
                         on_or_before: -> { Time.zone.now },
                         type: :date
                       },
                       allow_blank: true,
                       if: :start_date?

  def days_difference
    (Time.zone.today - start_date).to_i
  rescue TypeError
    raise :days_difference_errror
  end
end
