# == Schema Information
#
# Table name: disease_categories
#
#  id          :uuid             not null, primary key
#  color       :string           default(""), not null
#  description :string           default(""), not null
#  icon        :string           default(""), not null
#  name        :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_disease_categories_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :disease_category do
    
  end
end
