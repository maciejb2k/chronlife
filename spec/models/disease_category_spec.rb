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
require "rails_helper"

RSpec.describe DiseaseCategory, type: :model do
  describe "factory" do
    it "has a valid factory" do
      expect(build(:disease_category)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:diseases) }
  end

  describe "validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(100) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end

    describe "description" do
      it { is_expected.to validate_length_of(:description).is_at_most(250) }
    end

    describe "color" do
      it { is_expected.to allow_value("#ffffff").for(:color) }
      it { is_expected.to allow_value("#fff").for(:color) }
      it { is_expected.not_to allow_value("#fffff").for(:color) }
      it { is_expected.not_to allow_value("red").for(:color) }
    end
  end
end
