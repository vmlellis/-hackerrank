#!/bin/ruby

n,k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

rot = k % n
arr = []
(n - rot).times { |i| arr << a[i+rot] }
rot.times { |i| arr << a[i] }

puts arr.join(' ')
