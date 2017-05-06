#!/bin/ruby

def timeCompare(t1, t2)
  # Complete this function
end

q = gets.strip.to_i
for a0 in (0..q-1)
  t1, t2 = gets.strip.split(' ')
  result = timeCompare(t1, t2)
  puts result
end
