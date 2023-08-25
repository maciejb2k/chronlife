# == Schema Information
#
# Table name: specialists
#
#  id                         :uuid             not null, primary key
#  field_of_expertise         :string           default(""), not null
#  specialization             :string           default(""), not null
#  specialization_description :string           default(""), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :uuid             not null
#
# Indexes
#
#  index_specialists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Specialist, type: :model do
  describe "factory" do
    it { expect(build(:specialist)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    describe "specialization" do
      it { is_expected.to validate_presence_of(:specialization) }
      it { is_expected.to validate_length_of(:specialization).is_at_most(50) }
    end

    describe "specialization_description" do
      it { is_expected.to validate_presence_of(:specialization_description) }
      it { is_expected.to validate_length_of(:specialization_description).is_at_most(100) }
    end

    describe "field_of_expertise" do
      it { is_expected.to validate_presence_of(:field_of_expertise) }
      it { is_expected.to validate_length_of(:field_of_expertise).is_at_most(50) }
    end
  end
end
