class CreatePredefinedSymptoms < ActiveRecord::Migration[7.0]
  def change
    create_table :predefined_symptoms, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.string :related_names, array: true, default: []
      t.text :description, null: false, default: ""

      t.timestamps
    end

    add_index :predefined_symptoms, :name, unique: true
  end
end
