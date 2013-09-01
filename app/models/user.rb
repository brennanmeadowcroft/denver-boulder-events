class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_token, :user_key
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :first_name, :presence => true
  validates :password, :presence => true, length: { minimum: 6 }

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :new_users_open
  before_save :create_user_key

  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
  	Digest::SHA1.hexdigest(token.to_s)
  end

  private
  	def create_remember_token
  		self.remember_token = User.encrypt(User.new_remember_token)
  	end

    def create_user_key
      if self.user_key.nil?
        self.user_key = self.id.to_s + "_" + SecureRandom.urlsafe_base64.to_s
      end
    end

    def new_users_open
      false
    end
end
