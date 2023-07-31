# == Schema Information
#
# Table name: note_group_associations
#
#  id            :uuid             not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  note_group_id :uuid             not null
#  note_id       :uuid             not null
#
# Indexes
#
#  index_note_group_associations_on_note_group_id              (note_group_id)
#  index_note_group_associations_on_note_id                    (note_id)
#  index_note_group_associations_on_note_id_and_note_group_id  (note_id,note_group_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (note_group_id => note_groups.id)
#  fk_rails_...  (note_id => notes.id)
#
require 'rails_helper'

RSpec.describe NoteGroupAssociation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
