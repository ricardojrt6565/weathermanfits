# https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202487889&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys
require 'net/http'
require 'json'
require 'pp' 

url = 'https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202487889&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys'
uri = URI(url)
response = Net::HTTP.get(uri)
result = JSON.parse(response)
 pp result["query"]["results"]["channel"]["item"]["condition"]["temp"]
  
# Say for example i'm trying to get the "humidity"

