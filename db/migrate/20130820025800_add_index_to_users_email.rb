class AddIndexToUsersEmail < ActiveRecord::Migration
  def up
  	add_index :users, :email, unique: true
  end

  def down
  	remove_index :users, :column => [ :email ]
  end
end
