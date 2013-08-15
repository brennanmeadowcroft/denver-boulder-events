class Tag < ActiveRecord::Base
  attr_accessible :description, :event_ids

  has_and_belongs_to_many :events
end
