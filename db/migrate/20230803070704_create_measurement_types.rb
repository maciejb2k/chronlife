class CreateMeasurementTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :measurement_types, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.references :unit, null: false, foreign_key: true, type: :uuid
      t.decimal :upper_limit
      t.decimal :lower_limit

      t.timestamps
    end
  end
end
