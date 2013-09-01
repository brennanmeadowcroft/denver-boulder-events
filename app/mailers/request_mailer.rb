class RequestMailer < ActionMailer::Base
  default from: "Brennan - Denver Boulder Events <brennan@denverboulderevents.com>"

  def verify_email(request)
  	@request = request
  	@verify_url = "http://www.denverboulderevents.com/requests/#{ @request.id }/validate/#{ @request.verification_code }"
  	mail(to: @request.email, subject: 'Verify Your Email Address')
  end

  def welcome_email(request, ics_path)
  	@request = request
  	@ics_path = ics_path
  	mail(to: @request.email, subject: 'Welcome to DenverBoulderEvents.com')
  end

  def reminder_email(request)
    @request = request
    @verify_url = "http://www.denverboulderevents.com/requests/#{ @request.id }/validate/#{ @request.verification_code }"
    mail(to: @request.email, subject: 'Reminder To Validate Your Email')
  end
end
