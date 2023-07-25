class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :username
      t.text :bio, null: false, default: ""
      t.string :sex, null: false, default: ""
      t.date :birthday
      t.string :country, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.string :education, null: false, default: ""

      # Specialist role specific fields
      t.boolean :is_verified, null: false, default: false
      t.string :specialization, null: false, default: ""
      t.string :specialization_description, null: false, default: ""
      t.string :field_of_expertise, null: false, default: ""

      t.timestamps
    end

    add_index :accounts, :username, unique: true
    add_reference :accounts, :user, type: :uuid, foreign_key: true, null: false
  end
end
