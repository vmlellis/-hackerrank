#!/bin/ruby

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
res = 0
a.each { |x| res ^= x }
puts res
