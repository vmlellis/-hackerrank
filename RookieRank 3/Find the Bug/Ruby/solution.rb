#!/bin/ruby

n = gets.strip.to_i
grid = Array.new(n)
for row in (0..n-1)
  column = gets.strip.index('X')
  next if column.nil?
  puts [row, column].join(",")
  break
end
