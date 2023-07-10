# == Schema Information
#
# Table name: diseases
#
#  id                    :uuid             not null, primary key
#  color                 :string           default(""), not null
#  diagnosed_at          :date             not null
#  diagnosed_by          :string           default(""), not null
#  severity              :integer          default(1), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  account_id            :uuid             not null
#  disease_category_id   :uuid
#  predefined_disease_id :uuid             not null
#
# Indexes
#
#  index_diseases_on_account_id                            (account_id)
#  index_diseases_on_account_id_and_predefined_disease_id  (account_id,predefined_disease_id)
#  index_diseases_on_disease_category_id                   (disease_category_id)
#  index_diseases_on_predefined_disease_id                 (predefined_disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (disease_category_id => disease_categories.id)
#  fk_rails_...  (predefined_disease_id => predefined_diseases.id)
#
class Disease < ApplicationRecord
  belongs_to :account, dependent: :destroy
  belongs_to :predefined_disease, dependent: :destroy

  validates :diagnosed_at, timeliness: { on_or_before: -> { Time.zone.now }, type: :date },
                           allow_blank: true
  validates :diagnosed_by, length: { maximum: 100 }, allow_blank: true
  validates :severity, presence: true,
                       numericality: {
                         only_integer: true,
                         greater_than_or_equal_to: 1,
                         less_than_or_equal_to: 5
                       }
  validates :color, format: { with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i }, allow_blank: true
end