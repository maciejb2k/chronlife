# == Schema Information
#
# Table name: specialists
#
#  id                         :uuid             not null, primary key
#  field_of_expertise         :string           default(""), not null
#  specialization             :string           default(""), not null
#  specialization_description :string           default(""), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :uuid             not null
#
# Indexes
#
#  index_specialists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Specialist < ApplicationRecord
  belongs_to :user

  validates :specialization, presence: true, length: { maximum: 50 }
  validates :specialization_description, presence: true, length: { maximum: 100 }
  validates :field_of_expertise, presence: true, length: { maximum: 50 }
end
