class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :body, null: false, default: ""
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.references :commentable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
