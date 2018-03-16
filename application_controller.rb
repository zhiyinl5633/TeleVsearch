require 'dotenv/load'
require 'bundler'


Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

#display the from to search for the show
  get '/' do
    erb :index
  end
  
#display the info reults after submitting a form
  post '/result' do
    #have access to the methods to find the info
    @show_name = params[:name] 
    @show_info = Show.new(@show_name)
    @show_info.get_name
    @show_info.get_img
    @show_info.get_summary
    @show_info.get_language
    @show_info.get_genres
    @show_info.get_site
    erb :result
  end
  
  
end
