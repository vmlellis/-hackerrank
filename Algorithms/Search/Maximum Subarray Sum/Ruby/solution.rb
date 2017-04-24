#!/bin/ruby

def sums(arr, mod)
  sum = 0
  res = []
  res << [mod, -1]
  arr.each_with_index do |x, i|
    sum += x
    sum %= mod
    res << [sum, i]
  end
  res.sort_by! { |x, _| x }
end

def max_sum_subarray(arr, mod)
  sums = sums(arr, mod)
  min_diff = mod
  sums.each_cons(2) do |previous, current|
    next unless previous[1] > current[1]
    diff = current[0] - previous[0]
    min_diff = diff if diff < min_diff
  end
  mod - min_diff
end

q = gets.strip.to_i
q.times do
  n, m = gets.strip.split(' ').map(&:to_i)
  a = gets.split(' ').map(&:to_i)
  puts max_sum_subarray(a, m)
end
