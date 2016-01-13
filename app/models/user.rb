class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  extend FriendlyId
  friendly_id :user_name, use: [:slugged, :history]
  
  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy
  
  
  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
  
  def liked_bookmarks
    bookmarks = []
    likes.each {|like| bookmarks << Bookmark.find(like.bookmark_id) }
    bookmarks
  end
end
