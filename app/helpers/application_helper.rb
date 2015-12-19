module ApplicationHelper
    require 'embedly'
    require 'json'
    
    def display_title(url)
       embedly_api = Embedly::API.new(key: ENV['embedly_key'])
       obj = embedly_api.oembed url: url
       (obj.first.title).html_safe
    end
    def display_thumbnail(url)
       embedly_api = Embedly::API.new(key: ENV['embedly_key'])
       obj = embedly_api.oembed url: url
       (obj.first.thumbnail_url).html_safe
    end
    def display_description(url)
       embedly_api = Embedly::API.new(key: ENV['embedly_key'])
       obj = embedly_api.oembed url: url
       (obj.first.description).html_safe
    end
    
    def display_obj(url)
      embedly_api = Embedly::API.new(key: ENV['embedly_key'])
      obj = (embedly_api.oembed url: url).first
      ret = {thumbnail_url: obj.thumbnail_url, title: obj.title, description: obj.description}
    end
end
