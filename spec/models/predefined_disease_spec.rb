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
require 'rails_helper'

RSpec.describe PredefinedDisease, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
