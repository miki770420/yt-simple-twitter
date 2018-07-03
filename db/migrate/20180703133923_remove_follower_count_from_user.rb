class RemoveFollowerCountFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :Users, :follower_count
  end
end
