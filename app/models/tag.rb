class Tag < ActiveRecord::Base
  attr_accessible :description, :event_ids

  has_and_belongs_to_many :events

  def self.events_by_tag
  	data_array = self.find_by_sql("SELECT a.description, COUNT(DISTINCT b.event_id) AS total_events FROM tags AS a LEFT JOIN events_tags AS b ON(a.id = b.tag_id) GROUP BY a.id ORDER BY a.description ASC")

  	events_by_tag = Array.new
    data_array.each do |value|
      temp_array = Array.new
      temp_array << value.description
      temp_array << value.total_events

      events_by_tag << temp_array
    end

    return events_by_tag
  end
end
