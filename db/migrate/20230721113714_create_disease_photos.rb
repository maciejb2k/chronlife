class CreateDiseasePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :disease_photos, id: :uuid do |t|
      t.text :image_data
      t.string :caption, null: false, default: ""
      t.references :disease, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
