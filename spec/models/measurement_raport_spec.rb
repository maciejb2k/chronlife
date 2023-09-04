# == Schema Information
#
# Table name: measurement_raports
#
#  id              :uuid             not null, primary key
#  attachment_data :jsonb
#  name            :string           default(""), not null
#  raport_type     :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :uuid             not null
#
# Indexes
#
#  index_measurement_raports_on_account_id       (account_id)
#  index_measurement_raports_on_attachment_data  (attachment_data) USING gin
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "rails_helper"

RSpec.describe MeasurementRaport, type: :model do
  describe "factory" do
    it "has valid factory" do
      expect(create(:measurement_raport)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }
  end

  describe "validations" do
    describe "raport_type" do
      it { is_expected.to validate_presence_of(:raport_type) }
      it { is_expected.to validate_inclusion_of(:raport_type).in_array(MeasurementRaport::TYPES) }
    end

    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(100) }
    end
  end
end
