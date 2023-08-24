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
require "rails_helper"

RSpec.describe PredefinedDisease, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:disease).dependent(:destroy) }
    it { is_expected.to have_many(:predefined_symptoms).dependent(:destroy) }
    it { is_expected.to have_one(:group).dependent(:destroy) }
  end

  describe "validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(100) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end

    describe "description" do
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_length_of(:description).is_at_most(500) }
    end

    describe "icd10_code" do
      it { is_expected.to validate_length_of(:icd10_code).is_at_most(10) }
      it { is_expected.to allow_value("").for(:icd10_code) }
    end
  end

  describe "callbacks" do
    describe "after_create :create_group" do
      let(:predefined_disease) { create(:predefined_disease) }

      it "creates a group" do
        expect(predefined_disease.group).to be_present
      end
    end
  end
end
