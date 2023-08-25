# == Schema Information
#
# Table name: notes
#
#  id               :uuid             not null, primary key
#  background_color :string           default(""), not null
#  content          :text             default(""), not null
#  is_pinned        :boolean          default(FALSE), not null
#  title            :string           default(""), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :uuid             not null
#
# Indexes
#
#  index_notes_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "rails_helper"

RSpec.describe Note, type: :model do
  describe "factory" do
    it { expect(build(:note)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to have_many(:note_group_associations).dependent(:destroy) }

    it do
      is_expected.to(
        have_many(:groups).through(:note_group_associations).class_name("NoteGroup")
        .inverse_of(:notes)
      )
    end

    it { is_expected.to have_many(:note_tag_associations).dependent(:destroy) }

    it do
      is_expected.to(
        have_many(:tags).through(:note_tag_associations).class_name("NoteTag")
        .source(:note_tag).inverse_of(:notes)
      )
    end
  end

  describe "validations" do
    describe "title" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_length_of(:title).is_at_most(50) }
    end

    describe "content" do
      it { is_expected.to validate_presence_of(:content) }
      it { is_expected.to validate_length_of(:content).is_at_most(10_000) }
    end

    describe "background_color" do
      it { is_expected.to allow_value("#ffffff").for(:background_color) }
      it { is_expected.to allow_value("#fff").for(:background_color) }
      it { is_expected.to allow_value("fff").for(:background_color) }

      it { is_expected.not_to allow_value("red").for(:background_color) }
    end
  end
end
