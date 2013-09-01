class UsersController < ApplicationController
  layout "backend"
  before_filter :signed_in_user, :only => [:index, :edit, :update, :destroy]

  def index
    @users = User.all

    respond_to do |format|
      format.html
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html { render :layout => "public" }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:success] = "Signed up!"
        format.html { redirect_to admin_root_url }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        sign_in @user
        flash[:success] = "User successfully updated"
        format.html { redirect_to users_path }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    unless current_user?(@user)
      @user.destroy
      flash[:success] = "User deleted successfully"
    else
      flash[:error] = "Problem deleting the user"
    end

    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end