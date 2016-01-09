class BookmarksController < ApplicationController

  def destroy
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.destroy
      flash.now[:notice] = "Bookmark was deleted"
    else
      flash.now[:error] = "Bookmark could not be deleted"
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  
end
