# == Schema Information
#
# Table name: measurements
#
#  id                  :uuid             not null, primary key
#  is_within_limits    :boolean          default(TRUE), not null
#  measurement_date    :datetime         not null
#  value               :string           default("0.0"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  account_id          :uuid             not null
#  measurement_type_id :uuid             not null
#
# Indexes
#
#  index_measurements_on_account_id           (account_id)
#  index_measurements_on_measurement_type_id  (measurement_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (measurement_type_id => measurement_types.id)
#
require "rails_helper"

RSpec.describe Measurement, type: :model do
  describe "factory" do
    it { expect(build(:measurement)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:measurement_type) }
  end

  describe "validations" do
    describe "value" do
      it { is_expected.to validate_presence_of(:value) }
    end

    describe "measurement_date" do
      it { is_expected.to validate_presence_of(:measurement_date) }
      it { is_expected.to allow_value(Time.zone.today).for(:measurement_date) }
      it { is_expected.to allow_value(1.day.ago).for(:measurement_date) }
      it { is_expected.not_to allow_value(1.day.from_now).for(:measurement_date) }
    end
  end

  context "when measurement is weight" do
    let_it_be(:measurement) { create(:measurement, :weight) }

    it "passes validation" do
      expect(measurement).to(
        validate_numericality_of(:value)
        .is_greater_than_or_equal_to(1)
        .is_less_than_or_equal_to(300)
        .on(:measurement_weight)
      )
    end

    # Weight is always within limits, beacuse it is not checked
    # so the `is_within_limits` is always true
  end

  context "when measurement is heart beat" do
    let_it_be(:measurement) { create(:measurement, :heart_beat) }

    it "passes validation" do
      expect(measurement).to(
        validate_numericality_of(:value)
        .is_greater_than_or_equal_to(30)
        .is_less_than_or_equal_to(220)
        .on(:measurement_heart_beat)
      )
    end

    context "when value is within limits" do
      let_it_be(:measurement) { create(:measurement, :heart_beat) }

      it "is ok" do
        expect(measurement.is_within_limits).to be true
      end
    end

    context "when value is not within limits" do
      let_it_be(:measurement) { create(:measurement, :heart_beat, value: 10) }

      it "is not ok" do
        expect(measurement.is_within_limits).to be false
      end
    end
  end

  context "when measurement is blood pressure" do
    let_it_be(:measurement) { create(:measurement, :blood_pressure) }

    it "passes validation" do
      expect(measurement).to allow_value("120/80").for(:value).on(:measurement_blood_pressure)
      expect(measurement).not_to allow_value("123_80").for(:value).on(:measurement_blood_pressure)
      expect(measurement).not_to allow_value("XD").for(:value).on(:measurement_blood_pressure)
    end

    context "when value is within limits" do
      let_it_be(:measurement) { create(:measurement, :blood_pressure) }

      it "is ok" do
        expect(measurement.is_within_limits).to be true
      end
    end

    context "when value is not within limits" do
      let_it_be(:measurement) { create(:measurement, :blood_pressure, value: "200/200") }

      it "is not ok" do
        expect(measurement.is_within_limits).to be false
      end
    end
  end

  context "when measurement is sugar" do
    let_it_be(:measurement) { create(:measurement, :sugar) }

    it "passes validation" do
      expect(measurement).to(
        validate_numericality_of(:value)
        .is_greater_than_or_equal_to(0)
        .is_less_than_or_equal_to(1000)
        .on(:measurement_sugar)
      )
    end

    context "when value is within limits" do
      let_it_be(:measurement) { create(:measurement, :sugar) }

      it "is ok" do
        expect(measurement.is_within_limits).to be true
      end
    end

    context "when value is not within limits" do
      let_it_be(:measurement) { create(:measurement, :sugar, value: 10) }

      it "is not ok" do
        expect(measurement.is_within_limits).to be false
      end
    end
  end

  context "when measurement is spo2" do
    let_it_be(:measurement) { create(:measurement, :spo2) }

    it "passes validation" do
      expect(measurement).to(
        validate_numericality_of(:value)
        .is_greater_than_or_equal_to(0)
        .is_less_than_or_equal_to(100)
        .on(:measurement_spo2)
      )
    end

    context "when value is within limits" do
      let_it_be(:measurement) { create(:measurement, :spo2) }

      it "is ok" do
        expect(measurement.is_within_limits).to be true
      end
    end

    context "when value is not within limits" do
      let_it_be(:measurement) { create(:measurement, :spo2, value: 70) }

      it "is not ok" do
        expect(measurement.is_within_limits).to be false
      end
    end
  end

  describe "#blood_pressure_within_limits?" do
    let_it_be(:measurement) { create(:measurement) }

    context "when the value is within limits" do
      it "returns true" do
        expect(measurement.blood_pressure_within_limits?("120/80", "100/60", "139/89")).to be true
      end
    end

    context "when the value is not within limits" do
      it "returns false" do
        expect(measurement.blood_pressure_within_limits?("150/100", "100/60", "139/89")).to be false
      end
    end
  end

  describe "#within_limits?" do
    let_it_be(:measurement) { create(:measurement) }

    context "when the value is within limits" do
      it "returns true" do
        expect(measurement.within_limits?(50, 0, 100)).to be true
      end
    end

    context "when the value is not within limits" do
      it "returns false" do
        expect(measurement.within_limits?(150, 0, 100)).to be false
      end
    end
  end

  describe "#parse_blood_pressure" do
    let_it_be(:measurement) { create(:measurement) }

    it "returns systolic and diastolic values" do
      expect(measurement.parse_blood_pressure("120/80")).to eq([120, 80])
    end
  end
end
