require 'net/http'
require 'json'
require 'pp'
require 'clearbit'


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
   
    def get_info(type)
            @name.gsub(" ", "+")
            url = 'http://api.tvmaze.com/singlesearch/shows?q=' + "#{@name}" 
            uri = URI.parse(URI.encode(url.strip))
            response = Net::HTTP.get(uri)
            result = JSON.parse(response)
            if result[type].empty?
                puts "not working!"
                "Sorry, no #{type} is found"
            else
                puts "working!"
                result[type]
            end
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
            puts "logo link error"
            "http://www.fakingnews.firstpost.com/wp-content/uploads/2015/01/default.png"
        end
        
    end
end


show = Show.new("my ghost story")
#  show.get_name
#  show.get_img
#  show.get_summary
 show.get_genres
#  show.get_site