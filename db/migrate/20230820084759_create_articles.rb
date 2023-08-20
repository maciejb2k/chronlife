class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.text :body, null: false, default: ""
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
