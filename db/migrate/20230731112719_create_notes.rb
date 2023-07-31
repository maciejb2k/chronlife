class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.string :title, null: false, default: ""
      t.text :content, null: false, default: ""
      t.string :background_color, null: false, default: ""
      t.boolean :is_pinned, null: false, default: false
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
