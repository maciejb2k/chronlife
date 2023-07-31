class CreateNoteTagAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :note_tag_associations, id: :uuid do |t|
      t.references :note, null: false, foreign_key: true, type: :uuid
      t.references :note_tag, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :note_tag_associations, %i[note_id note_tag_id], unique: true
  end
end
