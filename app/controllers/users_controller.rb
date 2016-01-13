class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks
    @user_bookmark_topics = []
    @user_bookmarks.each { |bookmark| @user_bookmark_topics << bookmark.topic }
    @user_bookmark_topics.uniq!
    @liked_bookmarks = @user.liked_bookmarks
    @liked_bookmarks_topics = []
    @liked_bookmarks.each { |bookmark| @liked_bookmarks_topics << bookmark.topic }
    @liked_bookmarks_topics.uniq!
  end
end
