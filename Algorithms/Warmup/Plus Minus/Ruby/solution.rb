#!/bin/ruby

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
size = arr.size
v = arr.each_with_object([0, 0, 0]) do |x, res|
  x > 0 ? res[0] += 1 : x < 0 ? res[1] += 1 : res[2] += 1
end
puts v.map { |x| format('%.6f', x.to_f / size) }
