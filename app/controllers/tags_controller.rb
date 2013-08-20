class TagsController < ApplicationController
  layout "backend"
  before_filter :signed_in_user

  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
    end
  end

  def tag_list
    @tags = Tag.where("description like ?", "%#{params[:q]}%")

    respond_to do |format|
      format.json { render json: @tags }
    end
  end
end
