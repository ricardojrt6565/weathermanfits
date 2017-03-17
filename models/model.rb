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
        # to begin this app city and state are needed
    end
    
    def get_weather
        begin
            response = Weather.lookup_by_location(@city,@state)
            response.title
        rescue
            return "Sorry that's not a place"
        end
    end
    # get_weather/condition/text all get different aspects of weather from city/state chosen 
    def get_condition
        begin
            response = Weather.lookup_by_location(@city,@state)
            @temp = (response.condition.temp)*(9/5)+32
            # this section converts the weather into Fahrenheit 
            # instance temp was created in order to be able to create the get_clothing method
        rescue
            return "Doesn't exist"
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
            # compares weather numbers and gives back a recommended on what to wear
        rescue 
            return ""
        end
    end
    # Rescues are created so that if something goes wrong it has somewhere to turn and way of telling the user what's happening 
    def get_text
        begin
            response = Weather.lookup_by_location(@city,@state)
            response.condition.text
        rescue
           return ""
        end
    end
end


