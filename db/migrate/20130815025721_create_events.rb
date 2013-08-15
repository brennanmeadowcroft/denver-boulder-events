class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :event_name
      t.string :location
      t.text :notes
      t.datetime :start_date
      t.datetime :end_date
      t.string :frequency
      t.datetime :recurrence_end_date
      t.integer :recurrence_end_count
      t.string :recurrence_day
      t.integer :recurrence_frequency
      t.integer :user_id
      t.timestamps
    end
  end
  def down
  	drop_table :events
  end
end
