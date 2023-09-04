class CreateMeasurementRaports < ActiveRecord::Migration[7.0]
  def change
    create_table :measurement_raports, id: :uuid do |t|
      t.string :raport_type, null: false, default: ""
      t.string :name, null: false, default: ""
      t.jsonb :attachment_data
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :measurement_raports, :attachment_data, using: :gin
  end
end
