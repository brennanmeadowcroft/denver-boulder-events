class AddReminderFlagToRequests < ActiveRecord::Migration
  def up
  	add_column :requests, :reminded, :integer
  end
  def down
  	remove_column :requests, :reminded
  end
end
