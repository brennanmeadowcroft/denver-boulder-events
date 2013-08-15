class EventTagJoinTable < ActiveRecord::Migration
  def up
  	create_table :events_tags do |t|
  		t.integer :event_id
  		t.integer :tag_id
  	end
  end

  def down
  	drop_table :events_tags
  end
end
