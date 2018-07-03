class AddFollowerCountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :Users, :followships_count, :integer, :default => 0
    User.pluck(:id).each do |i|
      User.reset_counters(i, :followships)
    end
  end
end
