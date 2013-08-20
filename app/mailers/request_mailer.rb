class RequestMailer < ActionMailer::Base
  default from: "Brennan - Denver Boulder Events <brennan@denverboulderevents.com>"

  def verify_email(request)
  	@request = request
  	@verify_url = "http://www.denverboulderevents.com/requests/#{ @request.id }/validate/#{ @request.verification_code }"
  	mail(to: @request.email, subject: 'Verify Your Email Address')
  end

  def welcome_email(request)
  end
end
