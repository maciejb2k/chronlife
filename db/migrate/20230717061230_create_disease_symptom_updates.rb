class CreateDiseaseSymptomUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :disease_symptom_updates, id: :uuid do |t|
      t.integer :intensity, null: false, default: 0
      t.date :update_date, null: false, default: ""
      t.references :disease_symptom, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
