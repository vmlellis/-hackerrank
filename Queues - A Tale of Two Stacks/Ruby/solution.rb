#!/bin/ruby

q = gets.strip.to_i
arr = []
q.times do
  t, x = gets.strip.split(' ').map(&:to_i)
  arr << x if t == 1        # Queue
  arr.shift if t == 2       # Dequeue
  puts arr[0] if t == 3     # Print
end
