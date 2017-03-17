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
  # grabs user inputs and makes the App program run which is defined in the model.rb, these instance variables help me get around the MVC smoothly. Major results end up at result.erb
  erb :result
   
  end

end


