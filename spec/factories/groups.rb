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
FactoryBot.define do
  factory :group do
    
  end
end
