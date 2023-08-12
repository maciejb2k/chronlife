class CreateGroupPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :group_posts, id: :uuid do |t|
      t.string :body, null: false, default: ""
      t.references :group, null: false, foreign_key: true, type: :uuid
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
