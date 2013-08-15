class Event < ActiveRecord::Base
  attr_accessible :event_name, :location, :notes, :start_date, :end_date, :frequency, :recurrence_end_date, 
  					:recurrence_end_date, :recurrence_end_count, :recurrence_day, :recurrence_frequency

  def generate_ics_file
  end
end