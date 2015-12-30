class LoadWorker
    include Sidekiq::Worker
    include 'embedly'
    include 'json'
    
    def perform(url)
        embedly_api = Embedly::API.new(key: ENV['embedly_key'])
        embedly_api.oembed url: url
    end
    
    
end
