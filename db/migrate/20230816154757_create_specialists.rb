class CreateSpecialists < ActiveRecord::Migration[7.0]
  def change
    create_table :specialists, id: :uuid do |t|
      t.string :specialization, null: false, default: ""
      t.string :specialization_description, null: false, default: ""
      t.string :field_of_expertise, null: false, default: ""
      t.references :user, type: :uuid, foreign_key: true, null: false

      t.timestamps
    end
  end
end
