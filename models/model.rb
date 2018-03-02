require 'net/http'
require 'json'
require 'pp'

 
url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
uri = URI(url)
response = Net::HTTP.get(uri)
result = JSON.parse(response)


class Show
    def initialize(name) 
        
    end
end
