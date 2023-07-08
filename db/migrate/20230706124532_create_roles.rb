class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name, default: "", null: false

      t.timestamps
    end

    add_index :roles, :name, unique: true
  end
end
