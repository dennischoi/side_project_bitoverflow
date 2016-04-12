class ForumsController < ApplicationController
  def index
    @forum = Forum.all
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    if @forum.save
      redirect_to forums_url
    else
      render :new
    end

  end

  def show
    @forum = Forum.find(params[:id])
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to forums_url
  end

end
