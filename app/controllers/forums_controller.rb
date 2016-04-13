class ForumsController < ApplicationController
  def index
    @forums = Forum.all
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
    @forum = Forum.find(params[:id])

    if @forum.update_attributes(forum_params)
     redirect_to forums_url(@forum)
   elsif @forum.destroy
     redirect_to forums_url
   else
      render :edit
    end

  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to forums_url
  end

  private
  def forum_params
    params.require(:forum).permit(:title, :post, :description)
  end
end
