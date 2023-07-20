# == Schema Information
#
# Table name: disease_risk_factors
#
#  id          :uuid             not null, primary key
#  description :text             default(""), not null
#  name        :string           default(""), not null
#  severity    :integer          default(1), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  disease_id  :uuid             not null
#
# Indexes
#
#  index_disease_risk_factors_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#
require 'rails_helper'

RSpec.describe DiseaseRiskFactor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
