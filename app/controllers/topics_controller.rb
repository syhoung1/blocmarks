class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, notice: "Your topic has been created!"
    else
      flash[:alert] = "There was an error saving your topic!"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)
    
    if @topic.save
      redirect_to topics_path, notice: "Your topic has been created!"
    else
      flash[:alert] = "There was an error saving your topic!"
      render :new
    end
  end
      
  
  def topic_params
    params.require(:topic).permit(:title)
  end
end
