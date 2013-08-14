class RequestsController < ApplicationController
  layout "backend"

  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        RequestMailer.verify_email(@request).deliver

        flash[:success] = "Almost finished... We need to confirm your email address. To complete the subscription process, please click the link in the email we just sent you."
        format.html { redirect_to root_path }
      else
        flash[:error] = "There was an error submitting your request."
        format.html { redirect_to root_path }
      end
    end
  end

  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to requests_path, notice: 'Request was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def validate
    @request = Request.find(params[:id])
    @code = params[:code]

    if @request.verification_code = @code
      @request.validated = 1
    end

    respond_to do |format|
      if @request.save!
        format.html { redirect_to validation_success_path }
      else 
        format.html { redirect_to root }
      end
    end
  end

  def validation_success
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.validated = 1
        flash[:success] = "Email Validated!"
        format.html
      else
        flash[:error] = "We couldn't validate your email"
        format.html { redirect_to root }
      end
    end
  end

  def resend_validation
    @request = Request.find(params[:id])

    respond_to do |format|
      if RequestMailer.verify_email(@request).deliver
        flash[:success] = "Verfication Sent!"
        format.html { redirect_to requests_path }
      else 
        flash[:error] = "There was a problem sending the verification!"
        format.html { redirect_to requests_path }
      end
    end
  end

  def approve
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.approve
        format.html { redirect_to root }
      else 
        format.html { redirect_to root }
      end
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
    end
  end
end
