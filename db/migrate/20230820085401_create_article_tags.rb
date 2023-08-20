class CreateArticleTags < ActiveRecord::Migration[7.0]
  def change
    create_table :article_tags, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.timestamps
    end
  end
end
