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
class DiseaseCategory < ApplicationRecord
  has_many :diseases, dependent: :destroy

  has_one_attached :icon

  validates :name, length: { maximum: 100 }, presence: true, uniqueness: true
  validates :description, length: { maximum: 250 }, allow_blank: true
  validates :color, format: { with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i }, allow_blank: true
end
