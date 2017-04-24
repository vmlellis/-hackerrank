#!/bin/ruby

def max_sum_subarray(arr, modulus)
  target = modulus - 1
  prefix_arr = []
  total = 0
  (0...arr.length).each do |idx|
    total = (total + arr[idx]) % modulus
    return target if total == target
    prefix_arr[idx] = [total, idx]
  end

  sorted = prefix_arr.sort
  min = 0
  (0...sorted.length - 1).each do |i|
    if sorted[i][1] > sorted[i + 1][1] && sorted[i + 1][0] > sorted[i][0]
      test_case = [(modulus - ((sorted[i + 1][0] - sorted[i][0]) + modulus) % modulus), prefix_arr[sorted[i + 1][1]][0]].max
    else
      test_case = prefix_arr[sorted[i + 1][1]][0]
    end

    if test_case > min
      min = test_case
      min_range = [sorted[i + 1][1], sorted[i][1]]
    end
  end
  min
end

q = gets.strip.to_i
q.times do
  n, m = gets.strip.split(' ').map(&:to_i)
  a = gets.split(' ').map(&:to_i)
  puts max_sum_subarray(a, m)
end
