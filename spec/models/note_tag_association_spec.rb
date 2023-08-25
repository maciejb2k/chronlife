# == Schema Information
#
# Table name: note_tag_associations
#
#  id          :uuid             not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note_id     :uuid             not null
#  note_tag_id :uuid             not null
#
# Indexes
#
#  index_note_tag_associations_on_note_id                  (note_id)
#  index_note_tag_associations_on_note_id_and_note_tag_id  (note_id,note_tag_id) UNIQUE
#  index_note_tag_associations_on_note_tag_id              (note_tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (note_tag_id => note_tags.id)
#
require "rails_helper"

RSpec.describe NoteTagAssociation, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:note) }
    it { is_expected.to belong_to(:note_tag) }
  end

  describe "validations" do
    let_it_be(:note) { create(:note) }
    let_it_be(:note_tag) { create(:note_tag) }
    let_it_be(:note_tag_association) do
      create(:note_tag_association, note:, note_tag:)
    end

    it do
      expect(note_tag_association).to(
        validate_uniqueness_of(:note_tag_id)
        .scoped_to(:note_id)
        .case_insensitive.with_message(:taken)
      )
    end
  end
end
