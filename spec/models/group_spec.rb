# == Schema Information
#
# Table name: groups
#
#  id                    :uuid             not null, primary key
#  description           :string           default(""), not null
#  name                  :string           default(""), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  predefined_disease_id :uuid             not null
#
# Indexes
#
#  index_groups_on_predefined_disease_id  (predefined_disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (predefined_disease_id => predefined_diseases.id)
#
require "rails_helper"

RSpec.describe Group, type: :model do
  describe "factory" do
    it { expect(create(:group)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:predefined_disease) }
    it { is_expected.to have_many(:group_members).dependent(:destroy) }
    it { is_expected.to have_many(:accounts).through(:group_members) }

    it do
      is_expected.to(
        have_many(:posts).class_name("GroupPost").dependent(:destroy).inverse_of(:group)
      )
    end
  end

  describe "validations" do
    describe "name" do
      it { is_expected.to validate_length_of(:name).is_at_most(50).allow_blank }
    end

    describe "description" do
      it { is_expected.to validate_length_of(:description).is_at_most(100).allow_blank }
    end
  end
end
