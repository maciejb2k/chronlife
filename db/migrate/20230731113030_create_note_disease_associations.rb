class CreateNoteDiseaseAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :note_disease_associations, id: :uuid do |t|
      t.references :note, null: false, foreign_key: true, type: :uuid
      t.references :disease, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :note_disease_associations, %i[note_id disease_id], unique: true
  end
end
