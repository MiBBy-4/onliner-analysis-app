class RenameUrlToLink < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :url, :link
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
