require 'open-uri'
require 'json'

# Download bars catalog from JSON file hosted on GitHub
puts "Downloading data.."
database_url = "https://raw.githubusercontent.com/Velua/happy-hour/master/bars.json"
result = JSON.parse(open(database_url).read, {:symbolize_names => true})
bars = result[:bars]


# Work out the current time in order to look up any bars with happy hour on right now
time = Time.now
current_hour = time.strftime("%H")


# Returns bars with happy hour on
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
