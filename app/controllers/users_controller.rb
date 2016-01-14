class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])

    @user_bookmarks = @user.bookmarks.group_by(&:topic)
    @liked_bookmarks = @user.liked_bookmarks.group_by(&:topic)
    
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
  end
end
