# == Schema Information
#
# Table name: disease_photos
#
#  id         :uuid             not null, primary key
#  caption    :string           default(""), not null
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  disease_id :uuid             not null
#
# Indexes
#
#  index_disease_photos_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#
require "rails_helper"

RSpec.describe DiseasePhoto, type: :model do
  describe "factory" do
    it "has a valid factory" do
      expect(build(:disease_photo)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:disease) }
  end

  describe "validations" do
    describe "image" do
      it { is_expected.to validate_presence_of(:image) }
    end

    describe "caption" do
      it { is_expected.to validate_length_of(:caption).is_at_most(50) }
      it { is_expected.to allow_value("").for(:caption) }
    end
  end

  # TODO: Shrine validations
end
