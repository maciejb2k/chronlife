# == Schema Information
#
# Table name: treatments
#
#  id            :uuid             not null, primary key
#  description   :text             default(""), not null
#  effectiveness :integer          default(0), not null
#  end_date      :date
#  is_finished   :boolean          default(FALSE), not null
#  start_date    :date
#  title         :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :uuid             not null
#
# Indexes
#
#  index_treatments_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "rails_helper"

RSpec.describe Treatment, type: :model do
  describe "factory" do
    it { expect(build(:treatment)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }

    it do
      is_expected.to(
        have_many(:updates).dependent(:destroy)
        .class_name("TreatmentUpdate").inverse_of(:treatment)
      )
    end

    it { is_expected.to have_many(:treatment_diseases).dependent(:destroy) }
    it { is_expected.to have_many(:diseases).through(:treatment_diseases) }
  end

  describe "validations" do
    describe "title" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_length_of(:title).is_at_most(100) }
    end

    describe "description" do
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_length_of(:description).is_at_most(500) }
    end

    describe "effectiveness" do
      it { is_expected.to validate_presence_of(:effectiveness) }

      it do
        is_expected.to validate_numericality_of(:effectiveness)
          .only_integer
          .is_greater_than_or_equal_to(1)
          .is_less_than_or_equal_to(5)
      end
    end

    describe "start_date" do
      it { is_expected.to validate_presence_of(:start_date) }
      it { is_expected.to allow_value(Time.zone.today).for(:start_date) }
      it { is_expected.to allow_value(7.days.ago).for(:start_date) }

      it { is_expected.not_to allow_value(1.day.from_now).for(:start_date) }
    end

    describe "end_date" do
      context "when start_date is present" do
        subject { build(:treatment, start_date: 7.days.ago) }

        it { is_expected.to allow_value(Time.zone.today).for(:end_date) }
        it { is_expected.to allow_value(1.day.ago).for(:end_date) }
        it { is_expected.to allow_value(7.days.ago).for(:end_date) }

        it { is_expected.not_to allow_value(8.days.ago).for(:end_date) }
      end

      context "when start_date is not present" do
        # In this case you can set whatever end_date you want, but start_date must be present
        subject { build(:treatment, start_date: nil) }

        it { is_expected.to allow_value(1.day.from_now).for(:end_date) }
        it { is_expected.to allow_value(1.day.ago).for(:end_date) }
      end
    end
  end

  describe "#days_difference" do
    context "when the date is valid" do
      let_it_be(:treatment) { build(:treatment, start_date: 7.days.ago) }

      it "returns the difference in days between today and start_date" do
        expect(treatment.days_difference).to eq(7)
      end
    end

    # TODO: This branch of the method and the spec is to refactor
    context "when the date is invalid" do
      let_it_be(:treatment) { build(:treatment, start_date: "2023-23-343 432:324") }

      it "raises an error" do
        expect { treatment.days_difference }.to raise_error(TypeError)
      end
    end
  end
end
