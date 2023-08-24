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
require "rails_helper"

RSpec.describe DiseaseRiskFactor, type: :model do
  describe "Factory" do
    it "has valid factory" do
      expect(create(:disease_risk_factor)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:disease).inverse_of(:risk_factors) }
  end

  describe "validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(100) }
    end

    describe "description" do
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_length_of(:description).is_at_most(500) }
    end

    describe "severity" do
      it { is_expected.to validate_presence_of(:severity) }

      it do
        is_expected.to validate_numericality_of(:severity)
          .only_integer
          .is_greater_than_or_equal_to(1)
          .is_less_than_or_equal_to(5)
      end
    end
  end
end
