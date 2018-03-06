require 'net/http'
require 'json'
require 'pp'

 
url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
# uri = URI(url)
uri = URI.parse(URI.encode(url.strip))
response = Net::HTTP.get(uri)
result = JSON.parse(response)
# puts result
# puts result["name"]
# puts result["image"]["medium"]
# puts result["summary"]
# puts result["language"]
# puts result["genres"]

class Show
    attr_reader :name, :language, :type
    
    def initialize (name)
        @name = name
        @type = ' '
    end
    
   
    def get_info(type)
        @name.gsub(" ", "+")
        url = 'http://api.tvmaze.com/singlesearch/shows?q=' + "#{@name}" 
        uri = URI.parse(URI.encode(url.strip))
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        result[type]
    end
    
    def get_name
        self.get_info('name')
    end
    
    def get_img
        img = self.get_info('image')
        img["medium"]
    end
    
    def get_summary
        self.get_info('summary')
    end
    
    def get_language
        self.get_info('language')
    end
    
    def get_genres
       genres =  self.get_info('genres')
       genres.join(', ')
    end

end

# show = Show.new("w")
# show.get_name
# show.get_img
# show.get_summary
# show.get_genres
