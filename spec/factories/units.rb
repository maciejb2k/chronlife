# == Schema Information
#
# Table name: units
#
#  id          :uuid             not null, primary key
#  description :string           default(""), not null
#  name        :string           default(""), not null
#  symbol      :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_units_on_symbol  (symbol) UNIQUE
#
FactoryBot.define do
  factory :unit do
    
  end
end
