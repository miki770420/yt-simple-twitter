class RenameFollowshipsCountToFollowerCount < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :followships_count, :follower_count
  end
end
