class AddIcsTokenToRequests < ActiveRecord::Migration
  def up
  	add_column :requests, :ics_token, :string
  	add_index :requests, :ics_token
  end

  def down
  	remove_column :requests, :ics_token
  end
end
