class Bookmark < ActiveRecord::Base
  belongs_to :topic
  
  self.per_page = 3
  
end
