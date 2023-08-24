# == Schema Information
#
# Table name: diseases
#
#  id                    :uuid             not null, primary key
#  color                 :string           default(""), not null
#  diagnosed_at          :date
#  diagnosed_by_hp       :boolean          default(FALSE), not null
#  severity              :integer          default(1), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  account_id            :uuid             not null
#  disease_category_id   :uuid
#  predefined_disease_id :uuid             not null
#
# Indexes
#
#  index_diseases_on_account_id                            (account_id)
#  index_diseases_on_account_id_and_predefined_disease_id  (account_id,predefined_disease_id) UNIQUE
#  index_diseases_on_disease_category_id                   (disease_category_id)
#  index_diseases_on_predefined_disease_id                 (predefined_disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (disease_category_id => disease_categories.id)
#  fk_rails_...  (predefined_disease_id => predefined_diseases.id)
#
require "rails_helper"

RSpec.describe Disease, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:predefined_disease) }
    it { is_expected.to belong_to(:disease_category).optional }
    it { is_expected.to have_many(:treatment_diseases).dependent(:destroy) }
    it { is_expected.to have_many(:treatments).through(:treatment_diseases) }
    it { is_expected.to have_many(:symptoms).class_name("DiseaseSymptom").dependent(:destroy) }

    it {
      is_expected.to have_many(:risk_factors).class_name("DiseaseRiskFactor").dependent(:destroy)
    }

    it { is_expected.to have_many(:photos).class_name("DiseasePhoto").dependent(:destroy) }
    it { is_expected.to have_many(:statuses).class_name("DiseaseStatus").dependent(:destroy) }
  end

  describe "validations" do
    describe "diagnosed_at" do
      it { is_expected.to allow_value(nil).for(:diagnosed_at) }
      it { is_expected.to allow_value("").for(:diagnosed_at) }
      it { is_expected.to allow_value(Time.zone.today).for(:diagnosed_at) }
      it { is_expected.to allow_value(1.day.ago).for(:diagnosed_at) }
      it { is_expected.not_to allow_value(1.day.from_now).for(:diagnosed_at) }
    end

    describe "severity" do
      it { is_expected.to validate_presence_of(:severity) }
      it { is_expected.to validate_numericality_of(:severity).only_integer }
      it { is_expected.to validate_numericality_of(:severity).is_greater_than_or_equal_to(1) }
      it { is_expected.to validate_numericality_of(:severity).is_less_than_or_equal_to(5) }
    end

    describe "color" do
      it { is_expected.to allow_value(nil).for(:color) }
      it { is_expected.to allow_value("").for(:color) }
      it { is_expected.to allow_value("#ffffff").for(:color) }
      it { is_expected.to allow_value("ffffff").for(:color) }
      it { is_expected.to allow_value("#fff").for(:color) }
      it { is_expected.to allow_value("fff").for(:color) }

      it { is_expected.not_to allow_value("#fffff").for(:color) }
      it { is_expected.not_to allow_value("fffff").for(:color) }
      it { is_expected.not_to allow_value("#ffff").for(:color) }
      it { is_expected.not_to allow_value("ffff").for(:color) }
    end

    describe "predefined_disease_id" do
      subject { create(:disease) }

      it do
        is_expected.to(
          validate_uniqueness_of(:predefined_disease_id)
          .scoped_to(:account_id).case_insensitive.with_message(:taken)
        )
      end
    end
  end
end
