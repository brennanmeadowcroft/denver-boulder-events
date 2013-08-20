ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address		=> "mail.denverboulderevents.com",
  :port                 => 25,
  :domain               => "denverboulderevents.com",
  :user_name            => "brennan@denverboulderevents.com",
  :password             => "d3nv3r",
  :authentication       => "plain",
  :openssl_verify_mode => 'none'
}
