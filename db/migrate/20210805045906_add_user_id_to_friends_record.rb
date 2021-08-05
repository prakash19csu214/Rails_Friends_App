class AddUserIdToFriendsRecord < ActiveRecord::Migration[6.1]
  def change
    add_column :friends_records, :user_id, :integer
    add_index :friends_records, :user_id
  end
end
