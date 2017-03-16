# https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nyc%2C%20ny%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys
require 'net/http'
require 'json'
require 'pp' 
require 'weather-api'

# url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys" 
# uri = URI(url)
# response = Net::HTTP.get(uri)
# result = JSON.parse(response)
#  pp result["query"]["results"]["channel"]["location"]

# get the weather condition of any city/state

class App
    attr_reader :city, :state, :temp, :clothing
    def initialize(city,state)
        @city = city
        @state = state
        get_weather
    end
    
    def get_weather
        begin
            response = Weather.lookup_by_location(@city,@state)
            response.title
        rescue
            return "Sorry that's not a place"
        end
    end
    
    def get_condition
        begin
            response = Weather.lookup_by_location(@city,@state)
            @temp = (response.condition.temp)*(9/5)+32
            
        rescue
            return ""
        end
    end 
    
    def get_clothing
        begin
            if @temp >= -10 && @temp <= 10
                "You should wear jacket"
            elsif @temp >=11 && @temp <= 40
                "You need a thick sweater"
            elsif @temp >= 41 && @temp<= 60
                "layered shirts"
            elsif @temp >= 61 && @temp <= 99
                 "A tank top my guy"
            end
        rescue 
            return ""
        end
    end
    
    def get_text
        begin
            response = Weather.lookup_by_location(@city,@state)
            response.condition.text
        rescue
           return ""
        end
    end
end

# ak = App.new("Nome","Arkansas")
# puts ak.get_weather
# puts ak.get_condition
# puts ak.get_text

