class CreateFriendsRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :friends_records do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :twitter
      t.string :phone

      t.timestamps
    end
  end
end
