class RenamePostsColumn < ActiveRecord::Migration
  def change
    rename_column :posts, :admin_id, :user_id
  end
end
