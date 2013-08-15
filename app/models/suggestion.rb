class Suggestion < ActiveRecord::Base
  attr_accessible :email, :name, :content
end
