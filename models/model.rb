require 'net/http'
require 'json'
require 'pp'
require 'clearbit'

#using the url of the api to have access to info of the show from their api
url = 'http://api.tvmaze.com/singlesearch/shows?q=my-ghost-story'
# uri = URI(url)
uri = URI.parse(URI.encode(url.strip))
response = Net::HTTP.get(uri)
result = JSON.parse(response)
# pp result
# puts result["name"]
# puts result["image"]["medium"]
# puts result["summary"]
# puts result["language"]
# puts result["genres"]
# puts result["officialSite"]


class Show
    attr_reader :name, :language, :type
    
    def initialize (name)
        @name = name
        @type = ' '
    end
   
   #Template to get info from the api: need to subsitute the name,summary, etc to get the info
    def get_info(type)
            @name.gsub(" ", "+")
            url = 'http://api.tvmaze.com/singlesearch/shows?q=' + "#{@name}" 
            uri = URI.parse(URI.encode(url.strip))
            response = Net::HTTP.get(uri)
            result = JSON.parse(response)
            if result[type].empty?
                "Sorry, no #{type} is found"
            else
                result[type]
            end
    end
    
    #call the #get_info by plugging name to get the name of the show
    def get_name
        self.get_info('name')
    end
    
    #call the #get_info by plugging image to get the image of the show
    def get_img
        img = self.get_info('image')
        img["medium"]
    end
    
    #call the #get_info by plugging summary to get the summary of the show
    def get_summary
        self.get_info('summary')
    end
    
    #call the #get_info by plugging language to get the language of the show
    def get_language
        self.get_info('language')
    end
    
    #call the #get_info by plugging genres to get the genres of the show
    def get_genres
        genres =  self.get_info('genres')
        if genres.kind_of?(Array)
           genres.join(', ')
        else
            genres
        end
    end
    
    #call the #get_info by plugging site of the company it produced from to get the link of the company and use part of that link to get a logo image of the company
    def get_site
        begin
            site =self.get_info('officialSite')
            site_array = site.split(//)
            imp_index_array= site_array.each_index.select {|i| site_array[i]=="/"}
            imp_index = (imp_index_array[2].to_f)  + 1
            site_array.slice!(imp_index..-1)
            logo_link= "https://logo.clearbit.com/" + "#{site_array.join}"
            puts "logo_link: #{logo_link}"
            logo_link
        rescue
            "http://www.fakingnews.firstpost.com/wp-content/uploads/2015/01/default.png"
        end
        
    end
end


#  show = Show.new("my ghost story")
#  show.get_name
#  show.get_img
#  show.get_summary
#  show.get_genres
#  show.get_site