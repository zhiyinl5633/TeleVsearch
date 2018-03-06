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

def get_info(name)
    name.gsub(" ", "+")
    url = 'http://api.tvmaze.com/singlesearch/shows?q=' + "#{name}" 
    uri = URI.parse(URI.encode(url.strip))
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    puts result["name"]
end

# get_info("w")

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
        puts result[type]
    end
    
    def get_name
        self.get_info('name')
    end
    
    def get_img
        self.get_info('image')
    end
    
    def get_summary
        self.get_info('summary')
    end
    
    def get_genres
       genres =  self.get_info('genres')
    #   genres.join(', ')
    end

end

show = Show.new("w")
show.get_name
# show.get_img
show.get_summary
show.get_genres

    # def get_name(name)
    #     url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
    #     uri = URI(url)
    #     response = Net::HTTP.get(uri)
    #     result = JSON.parse(response)
    #     result["name"]
    
    # end
    # def get_img(name)
    #     url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
    #     uri = URI(url)
    #     response = Net::HTTP.get(uri)
    #     result = JSON.parse(response)
    #     result["image"]["original"]
    # end
    # def get_summary(name)
    #     url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
    #     uri = URI(url)
    #     response = Net::HTTP.get(uri)
    #     result = JSON.parse(response)
    #     result["summary"]
    # end
    # def get_language(name)
    #     url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
    #     uri = URI(url)
    #     response = Net::HTTP.get(uri)
    #     result = JSON.parse(response)
    #     result["language"]
    # end
    #  def get_genres(name)
    #     url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
    #     uri = URI(url)
    #     response = Net::HTTP.get(uri)
    #     result = JSON.parse(response)
    #     result["genres"].join(', ')
    # end
# end

# # get_info("w")
# get_name("w")
# get_img("w")
# get_summary("w")
# get_language("w")
# get_genres("w")
