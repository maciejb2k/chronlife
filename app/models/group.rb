# == Schema Information
#
# Table name: groups
#
#  id                    :uuid             not null, primary key
#  description           :string           default(""), not null
#  name                  :string           default(""), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  predefined_disease_id :uuid             not null
#
# Indexes
#
#  index_groups_on_predefined_disease_id  (predefined_disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (predefined_disease_id => predefined_diseases.id)
#
class Group < ApplicationRecord
  belongs_to :predefined_disease

  has_many :group_members, dependent: :destroy
  has_many :accounts, through: :group_members

  validates :name, allow_blank: true, length: { maximum: 50 }
  validates :description, allow_blank: true, length: { maximum: 100 }
end
