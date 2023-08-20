class CreateJoinTableArticleArticleTag < ActiveRecord::Migration[7.0]
  def change
    create_join_table :articles, :article_tags do |t|
      t.index %i[article_id article_tag_id], unique: true
    end
  end
end
