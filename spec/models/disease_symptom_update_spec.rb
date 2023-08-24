# == Schema Information
#
# Table name: disease_symptom_updates
#
#  id                 :uuid             not null, primary key
#  intensity          :integer          default(0), not null
#  update_date        :date             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  disease_symptom_id :uuid             not null
#
# Indexes
#
#  index_disease_symptom_updates_on_disease_symptom_id  (disease_symptom_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_symptom_id => disease_symptoms.id)
#
require "rails_helper"

RSpec.describe DiseaseSymptomUpdate, type: :model do
  describe "Factory" do
    it "has valid factory" do
      expect(create(:disease_symptom_update)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:symptom).inverse_of(:updates) }
  end

  describe "validations" do
    describe "intensity" do
      it { is_expected.to validate_presence_of(:intensity) }
      it { is_expected.to validate_numericality_of(:intensity).only_integer }

      it do
        is_expected.to validate_numericality_of(:intensity)
          .is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5)
      end
    end

    describe "update_date" do
      it { is_expected.to validate_presence_of(:update_date) }
      it { is_expected.to allow_value(Time.zone.now).for(:update_date) }
      it { is_expected.to allow_value(3.years.ago).for(:update_date) }
      it { is_expected.not_to allow_value(Time.zone.tomorrow).for(:update_date) }
    end
  end
end
