class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.string :symbol, null: false, default: ""
      t.string :description, null: false, default: ""

      t.timestamps
    end

    add_index :units, :symbol, unique: true
  end
end
