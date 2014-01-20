require 'open-uri'
require 'json'

puts "Welcome to the Directions App"
puts "Please enter Origin Address:"
origin = gets
origin = origin.chomp

puts "Please enter Destination Address:"
dest = gets
dest = dest.chomp

#Check for spaces to replace with + sign
if origin.match(" ")
	origin = origin.gsub!(/\s/,'+')
end

if dest.match(" ")
	dest = dest.gsub!(/\s/,'+')
end

#Call API
json_data = open("http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{dest}&sensor=false").read
data = JSON.parse(json_data)

#Traverse result
result = data["routes"]
legs = result[0]["legs"]
distance = legs[0]["distance"]
duration = legs[0]["duration"]

#Print Info
puts "Total travel time driving: " + duration["text"].to_s
puts "Total travel distance: " + distance["text"].to_s