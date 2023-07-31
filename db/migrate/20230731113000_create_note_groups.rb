class CreateNoteGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :note_groups, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :note_groups, %i[name account_id], unique: true
  end
end
