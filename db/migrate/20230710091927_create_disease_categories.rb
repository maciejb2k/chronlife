class CreateDiseaseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :disease_categories, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :icon, null: false, default: ""
      t.string :color, null: false, default: ""

      t.timestamps
    end

    add_index :disease_categories, :name, unique: true
  end
end
