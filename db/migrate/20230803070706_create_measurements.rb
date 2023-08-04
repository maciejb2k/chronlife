class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements, id: :uuid do |t|
      t.string :value, null: false, default: "0.0"
      t.datetime :measurement_date, null: false
      t.references :measurement_type, null: false, foreign_key: true, type: :uuid
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
