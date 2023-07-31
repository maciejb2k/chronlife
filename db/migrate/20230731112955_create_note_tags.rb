class CreateNoteTags < ActiveRecord::Migration[7.0]
  def change
    create_table :note_tags, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :note_tags, %i[name account_id], unique: true
  end
end
