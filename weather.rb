require 'open-uri'
require 'json'

puts "Welcome to the Weather App"
puts "Please enter an Address:"
address = gets
address = address.chomp

#Check for spaces to replace with + sign
if address.match(" ")
	address = address.gsub!(/\s/,'+')
end

#Call Geo API
json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read
data = JSON.parse(json_data)

#Traverse result
result = data["results"]
geo = result[0]["geometry"]
location = geo["location"]

#save Lat, Long
lat = location["lat"].to_s
lng = location["lng"].to_s

#Call Weather API
json_data = open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}").read
weatherData = JSON.parse(json_data)
tempKelvin = weatherData["main"]["temp"]
tempCelsius = tempKelvin - 273.15

#ºF =ºC * 1.8000 + 32.00
tempFar = (tempCelsius*1.8) + 32

#Output
puts "Temperature: " + tempFar.round(2).to_s + " F"
