class AddCounterCacheToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :followers_count, :integer, default: 0, null: false
    add_column :users, :followees_count, :integer, default: 0, null: false
  end
end
