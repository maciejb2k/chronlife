class CreateDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :diseases, id: :uuid do |t|
      t.date :diagnosed_at, null: false, default: ""
      t.string :diagnosed_by, null: false, default: ""
      t.integer :severity, null: false, default: 1
      t.string :color, null: false, default: ""

      t.timestamps
    end

    add_reference :diseases, :account, type: :uuid, foreign_key: true, null: false
    add_reference :diseases, :predefined_disease, type: :uuid, foreign_key: true, null: false
    add_reference :diseases, :disease_category, type: :uuid, foreign_key: true

    add_index :diseases, %i[account_id predefined_disease_id]
  end
end
