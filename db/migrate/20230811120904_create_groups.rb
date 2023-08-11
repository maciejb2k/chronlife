class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups, id: :uuid do |t|
      t.references :predefined_disease, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""

      t.timestamps
    end
  end
end
