class CreateGroupMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :group_members, id: :uuid do |t|
      t.references :group, foreign_key: true, type: :uuid
      t.references :account, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :group_members, %i[group_id account_id], unique: true
  end
end
