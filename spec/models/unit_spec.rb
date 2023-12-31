# == Schema Information
#
# Table name: units
#
#  id          :uuid             not null, primary key
#  description :string           default(""), not null
#  name        :string           default(""), not null
#  symbol      :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_units_on_symbol  (symbol) UNIQUE
#
require "rails_helper"

RSpec.describe Unit, type: :model do
  describe "factory" do
    it { expect(build(:unit)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to have_many(:measurement_types).dependent(:destroy) }
  end
end
