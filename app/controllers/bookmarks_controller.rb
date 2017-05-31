class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark
    
    if @bookmark.save
      redirect_to @topic, notice: "You've added a new bookmark!"
    else
      flash[:alert] = "There was an error adding your bookmark!"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    
    authorize @bookmark
    
    @bookmark.assign_attributes(bookmark_params)
    
    if @bookmark.save
      redirect_to @topic, notice: "Your changes have been saved!"
    else
      flash[:alert] = "Something went wrong while changing your bookmark!"
      render :edit
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    
    if @bookmark.destroy
      redirect_to @bookmark.topic, notice: "Bookmark deleted!"
    else
      flash[:alert] = "There was an error deleting this bookmark"
      render :show
    end
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
