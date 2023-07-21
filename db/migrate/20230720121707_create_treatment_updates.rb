class CreateTreatmentUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :treatment_updates, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.string :status, null: false, default: ""
      t.text :description, null: false, default: ""
      t.datetime :update_date, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.references :treatment, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
