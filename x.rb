
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
