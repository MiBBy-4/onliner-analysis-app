class DropArticleCommentsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :article_comments
  end
end
