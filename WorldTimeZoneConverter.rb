require 'httparty'
require 'json'

# Insert desired area and location here
response = HTTParty.get('http://worldtimeapi.org/api/timezone/Europe/London')
time_data = JSON.parse(response.body)

# Extract the current date and time
datetime = time_data["datetime"]

puts "The current time in Europe/London is #{datetime}"
