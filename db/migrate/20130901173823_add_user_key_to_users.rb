class AddUserKeyToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :user_key, :string
  	add_index :users, :user_key
  end

  def down
  	remove_column :users, :user_key
  end
end
