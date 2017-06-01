class LikesController < ApplicationController
  def index
  end
  
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like
    
    if like.save
      redirect_to @bookmark.topic, notice: "You've liked this bookmark!"
    else
      flash[:alert] = "There was an error liking this bookmark"
      redirect_to @bookmark.topic
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = @bookmark.likes.find(params[:id])
    authorize like
    
    if like.destroy
      redirect_to @bookmark.topic, notice: "You've unliked this bookmark!"
    else
      flash[:alert] = "There was an error unliking this bookmark"
      redirect_to @bookmark.topic
    end
  end
end
