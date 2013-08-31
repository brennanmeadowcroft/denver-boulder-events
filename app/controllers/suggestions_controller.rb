class SuggestionsController < ApplicationController
  layout "backend"
  before_filter :signed_in_user, only: [:index, :show, :destroy]

  def index
    @suggestions = Suggestion.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @suggestion = Suggestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])

    respond_to do |format|
      if @suggestion.save
        flash[:success] = "Suggestion Submitted. Thank you."
        format.html { redirect_to root_path }
      else
        flash[:error] = "There was a problem submitting your suggestion."
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])
    @suggestion.destroy

    respond_to do |format|
      format.html { redirect_to suggestions_url }
    end
  end
end
