class IncomingController < ApplicationController
    
    skip_before_action :verify_authenticity_token, only: [:create]
    
    def create
        user = User.find_by(email: params[:sender])
        if user
            topic = Topic.find_by(title: params[:subject])
            topic = Topic.create(title: params[:subject], user: user) unless topic
            url = params["body-plain"]
            Bookmark.create(url: url, topic: topic)
        end
        head 200
    end
    
end