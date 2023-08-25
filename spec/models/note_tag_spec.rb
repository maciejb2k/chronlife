# == Schema Information
#
# Table name: note_tags
#
#  id         :uuid             not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#
# Indexes
#
#  index_note_tags_on_account_id           (account_id)
#  index_note_tags_on_name_and_account_id  (name,account_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "rails_helper"

RSpec.describe NoteTag, type: :model do
  describe "factory" do
    it { expect(build(:note_tag)).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to have_many(:note_tag_associations).dependent(:destroy) }

    it do
      is_expected.to(
        have_many(:notes).through(:note_tag_associations).class_name("Note")
        .inverse_of(:tags)
      )
    end
  end

  describe "validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(50) }
      it { expect(build(:note_tag)).to validate_uniqueness_of(:name) }
    end
  end
end
