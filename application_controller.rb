require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  post '/result' do
    
     @user_city  = params[:city]
     @user_state = params[:state]
   @user_weather = App.new(@user_city,@user_state)
   
  erb :result
   
  end

end


