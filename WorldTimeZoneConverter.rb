require 'httparty'
require 'json'
require 'date'

# Insert desired area and location here
response = HTTParty.get('http://worldtimeapi.org/api/timezone/Europe/London')

time_data = JSON.parse(response.body)

# Extract the current date and time
datetime = time_data["datetime"]

# Parse the datetime string and format it
datetime = DateTime.parse(datetime).strftime("%Y-%m-%d %H:%M:%S")

# Print the current date and time in the specified format
puts "The current time in Europe/London is #{datetime}"
