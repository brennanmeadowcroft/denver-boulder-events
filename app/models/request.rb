class Request < ActiveRecord::Base
  attr_accessible :email, :approved, :validated, :verification_code

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_create :init

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
      self.verification_code = generate_verification_code()
    end

    def generate_verification_code
      size = 6
      charset = %w{ 2 3 4 6 7 9 a c d e f g h j k m n p q r t v w x y z A C D E F G H J K M N P Q R T V W X Y Z}
      key = (0..size).map{ charset.to_a[rand(charset.size) ] }.join
    
      return key
    end
end
