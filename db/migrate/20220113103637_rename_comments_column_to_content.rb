class RenameCommentsColumnToContent < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :comment, :content
  end
end
