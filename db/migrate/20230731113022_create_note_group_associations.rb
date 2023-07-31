class CreateNoteGroupAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :note_group_associations, id: :uuid do |t|
      t.references :note, null: false, foreign_key: true, type: :uuid
      t.references :note_group, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :note_group_associations, %i[note_id note_group_id], unique: true
  end
end
