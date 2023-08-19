class CreateMeasurementTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :measurement_types, id: :uuid do |t|
      t.references :unit, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false, default: ""
      t.string :upper_limit, null: false, default: ""
      t.string :lower_limit, null: false, default: ""

      t.timestamps
    end
  end
end
