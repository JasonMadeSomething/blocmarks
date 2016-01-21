class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like
    if @like.save
      flash.now[:notice] = "Bookmark liked"   
    else
      flash.now[:error] = "Bookmark could not be liked, try again later"
    end
    
    respond_to do |format|
      format.js
      format.html
    end
  end
    
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = Like.find_by(user_id: current_user.id, bookmark_id: @bookmark.id)
    authorize @like
    if @like.destroy
      flash.now[:notice] = "Bookmark unliked"
    else
      flash.now[:error] = "Bookmark could not be unliked, try again later"
    end
    respond_to do |format|
      format.js
      format.html
    end
  end
end
