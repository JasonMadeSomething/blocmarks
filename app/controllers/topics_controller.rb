class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.friendly.find(params[:id])
  end

  
  def create
    @topic = current_user.topics.new(topic_params)
    @new_topic = Topic.new
    authorize @topic
    if @topic.save
      flash.now[:notice] = "Topic created successfully."
    else
      flash.now[:error] = "Topic could not be created."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy
    @topic = Topic.friendly.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash.now[:notice] = "Topic was deleted."
    else
      flash.now[:error] = "Topic could not be deleted."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  
  private
  
  def topic_params
    params.require(:topic).permit(:title)
  end
end
