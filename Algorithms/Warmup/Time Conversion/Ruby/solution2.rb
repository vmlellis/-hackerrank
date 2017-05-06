#!/bin/ruby
def parse_time(time)
  hours, minutes, seconds, modifier = time.delete(':').scan(/\w{2}/)
  [correct_hours(hours, modifier), minutes, seconds].join(':')
end

def correct_hours(hours, modifier)
  return (hours.to_i + 12) if modifier == 'PM' && hours.to_i != 12
  return '00' if hours.to_i == 12 && modifier == 'AM'
  hours
end

puts parse_time(gets.chomp)
