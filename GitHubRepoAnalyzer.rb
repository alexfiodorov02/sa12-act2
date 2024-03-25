require 'httparty'
require 'json'

response = HTTParty.get('https://api.github.com/users/alexfiodorov02/repos')
repos = JSON.parse(response.body)

highest_star_count = 0
highest_star_repo = nil

repos.each do |repo|
  star_count = repo["stargazers_count"]

  if star_count > highest_star_count
    highest_star_count = star_count
    highest_star_repo = repo
  end
end

if highest_star_repo
  name = highest_star_repo["full_name"]
  description = highest_star_repo["forks_count"]
  svn_url = highest_star_repo["svn_url"]

  puts "Repository with the highest star count:"
  puts "Name: #{name}, Description: #{description}, Star Count: #{highest_star_count}, URL: #{svn_url}"
else
  puts "No repositories found."
end
