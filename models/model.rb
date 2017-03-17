require 'net/http'
require 'json'
require 'pp' 
require 'weather-api'

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
                "You should most definitely wear a jacket"
            elsif @temp >=11 && @temp <= 40
                "You'd probably need a thick sweater"
            elsif @temp >= 41 && @temp<= 60
                "Get pretty covered up"
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


