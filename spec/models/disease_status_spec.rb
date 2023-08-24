# == Schema Information
#
# Table name: disease_statuses
#
#  id         :uuid             not null, primary key
#  content    :text             default(""), not null
#  mood       :integer          default(3), not null
#  status     :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  disease_id :uuid             not null
#
# Indexes
#
#  index_disease_statuses_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#
require "rails_helper"

RSpec.describe DiseaseStatus, type: :model do
  describe "Factory" do
    it "has valid factory" do
      expect(create(:disease_status)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:disease).inverse_of(:statuses) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:reactions).dependent(:destroy) }
  end

  describe "validations" do
    describe "content" do
      it { is_expected.to validate_presence_of(:content) }
      it { is_expected.to validate_length_of(:content).is_at_most(500) }
    end

    describe "mood" do
      it { is_expected.to validate_presence_of(:mood) }

      it do
        is_expected.to validate_numericality_of(:mood)
          .only_integer
          .is_greater_than_or_equal_to(1)
          .is_less_than_or_equal_to(3)
      end
    end

    describe "status" do
      it { is_expected.to validate_presence_of(:status) }
      it { is_expected.to validate_inclusion_of(:status).in_array(DiseaseStatus::STATUSES) }

      describe "diagnosed?" do
        subject { create(:disease_status, status: "diagnosed") }

        it { is_expected.to be_diagnosed }
      end

      describe "suspicion?" do
        subject { create(:disease_status, status: "suspicion") }

        it { is_expected.to be_suspicion }
      end

      describe "deterioration?" do
        subject { create(:disease_status, status: "deterioration") }

        it { is_expected.to be_deterioration }
      end

      describe "significant_deterioration?" do
        subject { create(:disease_status, status: "significant_deterioration") }

        it { is_expected.to be_significant_deterioration }
      end

      describe "improvement?" do
        subject { create(:disease_status, status: "improvement") }

        it { is_expected.to be_improvement }
      end

      describe "significant_improvement?" do
        subject { create(:disease_status, status: "significant_improvement") }

        it { is_expected.to be_significant_improvement }
      end

      describe "cured?" do
        subject { create(:disease_status, status: "cured") }

        it { is_expected.to be_cured }
      end

      describe "relapsed?" do
        subject { create(:disease_status, status: "relapsed") }

        it { is_expected.to be_relapsed }
      end
    end
  end
end
