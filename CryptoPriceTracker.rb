require 'httparty'
require 'json'

response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
coins = JSON.parse(response.body)

# Sort the coins by market cap in descending order
sorted_coins = coins.sort_by { |coin| -coin["market_cap"] }

# Output the top 5 coins
puts "Top 5 cryptocurrencies by market capitalization:"
sorted_coins.first(5).each do |coin|
  name = coin["name"]
  current_price = coin["current_price"]
  market_cap = coin["market_cap"]

  puts "Name: #{name}, Current Price: #{current_price}, Market Capitalization: #{market_cap}"
end
