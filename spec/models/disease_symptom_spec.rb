# == Schema Information
#
# Table name: disease_symptoms
#
#  id                    :uuid             not null, primary key
#  description           :text             default(""), not null
#  first_noticed_at      :date
#  name                  :string           default(""), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  disease_id            :uuid             not null
#  predefined_symptom_id :uuid
#
# Indexes
#
#  index_disease_symptoms_on_disease_id                            (disease_id)
#  index_disease_symptoms_on_disease_id_and_predefined_symptom_id  (disease_id,predefined_symptom_id)
#  index_disease_symptoms_on_predefined_symptom_id                 (predefined_symptom_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#  fk_rails_...  (predefined_symptom_id => predefined_symptoms.id)
#
require "rails_helper"

RSpec.describe DiseaseSymptom, type: :model do
  describe "Factory" do
    it "has valid factory" do
      expect(create(:disease_symptom, :with_custom_symptom)).to be_valid
      expect(create(:disease_symptom, :with_predefined_symptom)).to be_valid
      expect { create(:disease_symptom) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:disease).inverse_of(:symptoms) }
    it { is_expected.to belong_to(:predefined_symptom).optional }

    it do
      is_expected.to have_many(:updates).class_name("DiseaseSymptomUpdate")
                                        .dependent(:destroy).inverse_of(:symptom)
    end
  end

  describe "validations" do
    describe "name" do
      subject { build(:disease_symptom, :with_custom_symptom) }

      it { is_expected.to validate_length_of(:name).is_at_most(100) }
    end

    describe "description" do
      it { is_expected.to validate_length_of(:description).is_at_most(500) }
      it { is_expected.to validate_presence_of(:description) }
    end

    describe "first_noticed_at" do
      it { is_expected.to allow_value(Time.zone.now).for(:first_noticed_at) }
      it { is_expected.to allow_value(3.years.ago).for(:first_noticed_at) }

      it { is_expected.not_to allow_value(1.day.from_now).for(:first_noticed_at) }

      it { is_expected.to allow_value("", nil).for(:first_noticed_at) }
    end

    describe "predefined_symptom_id" do
      subject { create(:disease_symptom, :with_predefined_symptom) }

      it do
        is_expected.to(
          validate_uniqueness_of(:predefined_symptom_id)
          .scoped_to(:disease_id)
          .case_insensitive.with_message(:taken)
        )
      end
    end

    describe "#only_one_field_set" do
      context "when both predefined_symptom_id and name are blank" do
        let_it_be(:disease_symptom) { build(:disease_symptom) }

        it "is invalid" do
          expect(disease_symptom).not_to be_valid
          expect(disease_symptom.errors[:predefined_symptom_id].size).to eq 1
          expect(disease_symptom.errors[:predefined_symptom_id]).to(
            include I18n.t("activerecord.errors.models.disease_symptom.set_name_or_predefined")
          )
        end
      end

      context "when predefined_symptom_id is present and name is blank" do
        let_it_be(:disease_symptom) { build(:disease_symptom, :with_predefined_symptom) }

        it "is valid" do
          expect(disease_symptom).to be_valid
          expect(disease_symptom.errors[:predefined_symptom_id].size).to eq 0
          expect(disease_symptom.predefined_symptom_id).to be_present
        end
      end

      context "when predefined_symptom_id is blank and name is present" do
        let_it_be(:disease_symptom) { build(:disease_symptom, :with_custom_symptom) }

        it "is valid" do
          expect(disease_symptom).to be_valid
          expect(disease_symptom.errors[:predefined_symptom_id].size).to eq 0
          expect(disease_symptom.name).to be_present
        end
      end

      context "when predefined_symptom_id and name are present" do
        let_it_be(:disease_symptom) do
          build(:disease_symptom, :with_predefined_symptom, :with_custom_symptom)
        end

        it "is invalid" do
          expect(disease_symptom).not_to be_valid
          expect(disease_symptom.errors[:predefined_symptom_id].size).to eq 1
          expect(disease_symptom.errors[:predefined_symptom_id]).to(
            include I18n.t("activerecord.errors.models.disease_symptom.only_name_or_predefined")
          )
        end
      end
    end
  end
end
