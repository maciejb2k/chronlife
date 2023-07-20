class CreateTreatmentDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :treatment_diseases, id: :uuid do |t|
      t.references :treatment, null: false, foreign_key: true, type: :uuid
      t.references :disease, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :treatment_diseases, %i[treatment_id disease_id], unique: true
  end
end
