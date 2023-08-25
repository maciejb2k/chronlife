# == Schema Information
#
# Table name: treatment_updates
#
#  id           :uuid             not null, primary key
#  description  :text             default(""), not null
#  name         :string           default(""), not null
#  status       :string           default(""), not null
#  update_date  :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  treatment_id :uuid             not null
#
# Indexes
#
#  index_treatment_updates_on_treatment_id  (treatment_id)
#
# Foreign Keys
#
#  fk_rails_...  (treatment_id => treatments.id)
#
require "rails_helper"

RSpec.describe TreatmentUpdate, type: :model do
  describe "factory" do
    it { expect(build(:treatment_update)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:treatment).inverse_of(:updates) }
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

    describe "status" do
      it { is_expected.to validate_presence_of(:status) }
      it { is_expected.to validate_inclusion_of(:status).in_array(TreatmentUpdate::STATUSES) }
    end

    describe "update_date" do
      it { is_expected.to allow_value(Time.zone.today).for(:update_date) }
      it { is_expected.to allow_value(1.day.ago).for(:update_date) }
      it { is_expected.not_to allow_value(1.day.from_now).for(:update_date) }
    end
  end

  describe "#improvement?" do
    let_it_be(:update) { create(:treatment_update, status: "improvement") }
    it { expect(be_improvement).to be_truthy }
  end

  describe "#no_change?" do
    let_it_be(:update) { create(:treatment_update, status: "no_change") }
    it { expect(be_no_change).to be_truthy }
  end

  describe "#worsening?" do
    let_it_be(:update) { create(:treatment_update, status: "worsening") }
    it { expect(be_worsening).to be_truthy }
  end
end
