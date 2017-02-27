require 'open-uri'
require 'json'

database_url = "https://raw.githubusercontent.com/Velua/happy-hour/master/bars.json"
result = JSON.parse(open(database_url).read, {:symbolize_names => true})

puts result
