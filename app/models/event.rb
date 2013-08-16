class Event < ActiveRecord::Base
  attr_accessible :event_name, :location, :notes, :start_date, :end_date, :frequency, :recurrence_end_date, 
  					:recurrence_end_date, :recurrence_end_count, :recurrence_day, :recurrence_frequency, :tag_ids, 
  					:tag_tokens
  	attr_reader :tag_tokens

  has_and_belongs_to_many :tags

  def recurrence_rule
    if !self.frequency.nil? && self.frequency != ''
      freq = "RRULE:FREQ=#{self.frequency.upcase};"
    else
      freq = ''
    end

    if !self.recurrence_end_date.nil? && self.recurrence_end_date != ''
      until_date = "UNTIL=#{self.recurrence_end_date.to_s(:long_ical)};"
    else
      until_date = ''
    end

    if !self.recurrence_frequency.nil? && self.recurrence_frequency != ''
      interval = "INTERVAL=#{self.recurrence_frequency};"
    else
      interval = ''
    end

    if !self.recurrence_day.nil? && self.recurrence_day != ''
      weekday = "BYDAY=#{self.recurrence_day.upcase.gsub(/\s/, '')};"
    else
      weekday = ''
    end

    if !self.recurrence_end_count.nil? && self.recurrence_end_count != ''
      if weekday != ''
        total_times = self.recurrence_day.split(/,\s/).count
      else
        total_times = 1
      end
      n_times = "COUNT=#{self.recurrence_end_count * total_times};"
    else 
      n_times = ''
    end

    rrule = freq + n_times + until_date + interval + weekday
    rrule.chomp(";")
  end

  def tag_tokens=(tokens)
  	self.tag_ids = tokens.split(',')
  end

  def tag_tokens
  	self.tag_ids
  end
end