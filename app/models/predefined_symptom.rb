# == Schema Information
#
# Table name: predefined_symptoms
#
#  id            :uuid             not null, primary key
#  description   :text             default(""), not null
#  name          :string           default(""), not null
#  related_names :string           default([]), is an Array
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_predefined_symptoms_on_name  (name) UNIQUE
#
class PredefinedSymptom < ApplicationRecord
  validates :name, length: { maximum: 100 }, presence: true, uniqueness: true
  validates :description, length: { maximum: 500 }, presence: true
end
