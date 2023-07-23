class CreateDiseaseStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :disease_statuses, id: :uuid do |t|
      t.text :content, null: false, default: ""
      t.string :status, null: false, default: ""
      t.integer :mood, null: false, default: 3
      t.references :disease, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
