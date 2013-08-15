class Event < ActiveRecord::Base
  attr_accessible :event_name, :location, :notes, :start_date, :end_date, :frequency, :recurrence_end_date, 
  					:recurrence_end_date, :recurrence_end_count, :recurrence_day, :recurrence_frequency, :tag_ids, 
  					:tag_tokens
  	attr_reader :tag_tokens

  has_and_belongs_to_many :tags

  def generate_ics_file
  end

  def tag_tokens=(tokens)
  	self.tag_ids = tokens.split(',')
  end

  def tag_tokens
  	self.tag_ids
  end
end