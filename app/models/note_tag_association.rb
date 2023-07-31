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
class NoteTagAssociation < ApplicationRecord
  belongs_to :note
  belongs_to :note_tag

  validates :note_id, uniqueness: { scope: :note_tag_id }
end
