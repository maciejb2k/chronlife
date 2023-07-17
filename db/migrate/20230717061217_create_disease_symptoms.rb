class CreateDiseaseSymptoms < ActiveRecord::Migration[7.0]
  def change
    create_table :disease_symptoms, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.date :first_noticed_at
      t.references :disease, null: false, foreign_key: true, type: :uuid
      t.references :predefined_symptom, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :disease_symptoms, %i[disease_id predefined_symptom_id]
  end
end
