class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments, id: :uuid do |t|
      t.string :title, null: false, default: ""
      t.text :description, null: false, default: ""
      t.date :start_date
      t.date :end_date
      t.boolean :is_finished, null: false, default: false
      t.integer :effectiveness, null: false, default: 0
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
