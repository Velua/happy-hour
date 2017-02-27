bars = [
  { :name => 'Charlies Bar', :address => '71 Hardware Lane Melbourne', :happy_hour_start => '17' },
  { :name => 'Equinox Resturant Bar', :address => 'Elizabeth Street', :happy_hour_start => '18' },
  { :name => 'Asian Beer Cafe', :address => '211 La Trobe St Melbourne', :happy_hour_start => '17' },
  { :name => 'Blue Moon Bar', :address => '380 Russell Street', :happy_hour_start => '19' },
  { :name => 'The Duke Of Wellington', :address => '146 Flinders Street', :happy_hour_start => '17' }
]

time = Time.now
current_hour = time.strftime("%H")

def get_happy_hours(bars, the_hour = Time.now.strftime("%H"))
  # Empty array of Bars with happy hour on
  happy_hours = []

  bars.each do | bar |
    if the_hour == bar[:happy_hour_start]
      happy_hours.push(bar)
    end
  end
  return happy_hours
end


def display_bars(bars, on_Startup=false)
  if on_Startup == false
    system('clear')
  end
  if bars.length == 0
    puts "No bars found!"
    return 0
  else
    puts "Bars found!"
    puts ""
    bars.each do | bar |
      puts "Name: #{bar[:name]}"
      puts "Location: #{bar[:address]}"
      puts "Happy Hour: #{bar[:happy_hour_start]}"
      puts ""
    end
  end
end

system('clear')

def introduction(bars)
  time = Time.now
  current_time = time.strftime("%H:%M:%S")
  puts "Welcome to Happy Hour!"
  puts "It's #{current_time}"
  puts ""
  puts "Looking up bars right this hour.."
  bars_available_now = get_happy_hours(bars)
  display_bars(bars_available_now, on_Startup=true)
end


introduction(bars)
while loop do
  puts "Want to specify an hour? 24 hour - e.g. 7:00pm enter only '19'"
  puts "Enter 'q' to quit"
  asked_hour = gets.chomp
  if asked_hour == 'q'
    break
  end
  bars_query = get_happy_hours(bars, asked_hour)
  display_bars(bars_query)
end
