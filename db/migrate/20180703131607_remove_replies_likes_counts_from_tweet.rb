class RemoveRepliesLikesCountsFromTweet < ActiveRecord::Migration[5.1]
  def change
    remove_column :tweets, :replies_count
    remove_column :tweets, :likes_count
  end
end
