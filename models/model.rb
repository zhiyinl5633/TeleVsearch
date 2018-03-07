require 'net/http'
require 'json'
require 'pp'

 
# url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# putsresult = JSON.parse(response)
# puts result["name"]
# puts result["image"]["original"]
# puts result["summary"]
# puts result["language"]
# puts result["genres"]

# class Show
#     def initialize(name) 
#         @name= name
#         # @img
#         # @summary
#         # @language
#         # @genre
#     end
    # def get_info(name)
    #     url = 'http://api.tvmaze.com/singlesearch/shows?q=w'
    #     uri = URI(url)
    #     response = Net::HTTP.get(uri)
    #     result = JSON.parse(response)
    #     result["name"]
    #     result["image"]["original"]
    #     result["summary"]
    #     result["language"]
    #     result["genres"]
    # end
    
    def get_name(name)
        url = 'http://api.tvmaze.com/singlesearch/shows?q=#{name}'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        result["name"]
    
    end
    def get_img(name)
        url = 'http://api.tvmaze.com/singlesearch/shows?q=#{name}'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        result["image"]["original"]
    end
    def get_summary(name)
        url = 'http://api.tvmaze.com/singlesearch/shows?q=#{name}'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        result["summary"]
    end
    def get_language(name)
        url = 'http://api.tvmaze.com/singlesearch/shows?q=#{name}'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        result["language"]
    end
     def get_genres(name)
        url = 'http://api.tvmaze.com/singlesearch/shows?q=#{name}'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        result["genres"].join(', ')
    end
# end

# get_info("w")
get_name("w")
get_img("w")
get_summary("w")
get_language("w")
get_genres("w")
