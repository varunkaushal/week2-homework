require 'open-uri'
require 'json'

puts "Welcome to the GeoLocate App"
puts "Please enter an Address, City or Zipcode:"
address = gets
address = address.chomp

#Check for spaces to replace with + sign
if address.match(" ")
	address = address.gsub!(/\s/,'+')
end

#Call API
json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read
data = JSON.parse(json_data)

#Traverse result
result = data["results"]
geo = result[0]["geometry"]
location = geo["location"]

#Print Lat, Long
puts "Latitude: " + location["lat"].to_s
puts "Longitude: " + location["lng"].to_s