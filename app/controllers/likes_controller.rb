class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like
    if like.save
      flash[:notice] = "Bookmark liked"   
    else
      flash[:error] =  "Bookmark could not be liked, try again later"
    end
    redirect_to :back
  end
    
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find_by(user_id: current_user.id, bookmark_id: @bookmark.id)
    authorize like
    if like.destroy
      flash[:notice] = "Bookmark unliked"
    else
      flash[:error] = "Bookmark could not be unliked, try again later"
    end
    redirect_to :back
  end
end
