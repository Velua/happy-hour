require 'open-uri'
require 'json'

database_url = "https://raw.githubusercontent.com/Velua/happy-hour/master/bars.json"
result = JSON.parse(open(database_url).read, {:symbolize_names => true})

bars = result[:bars]

puts bars
puts "****"

bars_2 = [
  { :name => 'Charlies Bar', :address => '71 Hardware Lane Melbourne', :happy_hour_start => '17' },
  { :name => 'Equinox Resturant Bar', :address => 'Elizabeth Street', :happy_hour_start => '18' },
  { :name => 'Asian Beer Cafe', :address => '211 La Trobe St Melbourne', :happy_hour_start => '17' },
  { :name => 'Blue Moon Bar', :address => '380 Russell Street', :happy_hour_start => '19' },
  { :name => 'The Duke Of Wellington', :address => '146 Flinders Street', :happy_hour_start => '17' }
]

puts bars_2
