#!/bin/ruby

n = gets.strip.to_i
puts (1..n).map { |i| (' ' * (n - i)) + ('#' * i) }
