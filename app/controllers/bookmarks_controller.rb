class BookmarksController < ApplicationController

  def destroy
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted"
    else
      flash[:error] = "Bookmark could not be deleted"
    end
    redirect_to :back
  end

  
end
