class Request < ActiveRecord::Base
  attr_accessible :email, :approved, :ics_token, :reminded, :validated, :verification_code

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_create :init

  def self.requests_by_day
    data_array = self.find_by_sql("SELECT DATE(created_at) AS created_at, COUNT(*) AS total_requests FROM requests GROUP BY DATE(created_at) ORDER BY created_at ASC")

    requests_by_day = Array.new
    data_array.each do |value|
      temp_array = Array.new
      temp_array << value.created_at.strftime('%Y-%m-%d')
      temp_array << value.total_requests

      requests_by_day << temp_array
    end

    return requests_by_day
  end

  def self.cumul_requests_by_day
    data_array = self.find_by_sql("SELECT DATE(a.created_at) AS created_at, 
                            (SELECT COUNT(*) 
                              FROM requests AS b 
                              WHERE created_at <= a.created_at) AS running_total 
                      FROM requests AS a 
                      GROUP BY DATE(a.created_at) 
                      ORDER BY DATE(a.created_at) ASC")

    cumul_requests_by_day = Array.new
    data_array.each do |value|
      temp_array = Array.new
      temp_array << value.created_at.strftime('%Y-%m-%d')
      temp_array << value.running_total

      cumul_requests_by_day << temp_array
    end

    return cumul_requests_by_day
  end

  def self.request_validations
    data_array = self.find_by_sql("SELECT COUNT(*) AS total_requests, SUM(validated) AS total_validations FROM requests")

    request_validations = Array.new
    temp_array = Array.new
    temp_array << 'Count'
    temp_array << data_array.first.total_requests
    temp_array << data_array.first.total_validations
    request_validations << temp_array

    return request_validations
  end

  def self.unvalidated_users
    remind_date = (Time.now - 7.days).strftime('%Y-%m-%d')
    self.find_by_sql("SELECT * FROM requests WHERE reminded IS NULL AND validated = 0 AND created_at < DATE('#{remind_date}')")
  end

  def validate
  	self.validated = 1
    self.reminded = 0
    self.ics_token = generate_ics_token()
  	save!
  end

  def approve
  	self.approved = 1
  	save!
  end

  def generate_ics_token
    self.id.to_s + "_" + SecureRandom.urlsafe_base64.to_s
  end

  private
    def init
      self.approved = 0
      self.validated = 0
      self.verification_code = generate_verification_code()
      self.ics_token = generate_ics_token()
    end

    def generate_verification_code
      size = 6
      charset = %w{ 2 3 4 6 7 9 a c d e f g h j k m n p q r t v w x y z A C D E F G H J K M N P Q R T V W X Y Z}
      key = (0..size).map{ charset.to_a[rand(charset.size) ] }.join
    
      return key
    end
end
