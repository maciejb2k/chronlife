class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles, id: :uuid do |t|
      t.timestamps
    end

    add_reference :user_roles, :user, type: :uuid, foreign_key: true, null: false
    add_reference :user_roles, :role, type: :uuid, foreign_key: true, null: false
    add_index :user_roles, %i[user_id role_id]
  end
end
