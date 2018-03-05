require 'dotenv/load'
require 'bundler'

Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
   
    erb :index
  end
  
  post '/result' do
     @user_name = params[:show_name] 
     @user_img=get_img(@user_name)
     @user_summary=get_summary(@user_name)
     @user_language=get_language(@user_name)
     @user_genres=get_genres(@user_name)
    erb :result
  end
  
  
end
