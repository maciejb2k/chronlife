# == Schema Information
#
# Table name: predefined_diseases
#
#  id            :uuid             not null, primary key
#  description   :text             default(""), not null
#  icd10_code    :string           default(""), not null
#  name          :string           default(""), not null
#  related_names :string           default([]), is an Array
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_predefined_diseases_on_name  (name) UNIQUE
#
class PredefinedDisease < ApplicationRecord
  has_many :disease, dependent: :destroy
  has_many :predefined_symptoms, dependent: :destroy

  validates :name, length: { maximum: 100 }, presence: true, uniqueness: true
  validates :description, length: { maximum: 500 }, presence: true
  validates :icd10_code, length: { maximum: 10 }, allow_blank: true
end
