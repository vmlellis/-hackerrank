#!/bin/ruby

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
min = (a[1] - a[0]).abs
a.sort.each_cons(2) do |x|
  min = [min, (x[1] - x[0]).abs].min
end
puts min
