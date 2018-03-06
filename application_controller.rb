require 'dotenv/load'
require 'bundler'


Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
   
    erb :index
  end
  
  post '/result' do
    @show_name = params[:name] 
    @show_info = Show.new(@show_name)
    @show_info.get_name
    @show_info.get_img
    @show_info.get_summary
    @show_info.get_language
    @show_info.get_genres
    erb :result
  end
  
  
end
