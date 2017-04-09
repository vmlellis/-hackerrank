#!/bin/ruby

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

swaps = 0
(0...n).each do |i|
  ordered = true
  (0...n-1).each do |j|
    if a[j] > a[j + 1]
      aux = a[j]
      a[j] = a[j + 1]
      a[j + 1] = aux
      swaps += 1
      ordered = false
    end
  end
  break if ordered
end

puts "Array is sorted in #{swaps} swaps."
puts "First Element: #{a.first}"
puts "Last Element: #{a.last}"
