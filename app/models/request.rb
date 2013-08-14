class Request < ActiveRecord::Base
  attr_accessible :email, :approved, :validated

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_save :init

  def validate
  	self.validated = 1
  	save!
  end

  def approve
  	self.approved = 1
  	save!
  end

  private
    def init
      self.approved = 0
      self.validated = 0
    end
end
