#!/bin/ruby

def is_prime(n)
  return false if n < 2
  return true if n <= 3
  return false if (n % 2).zero? || (n % 3).zero?
  (3..Math.sqrt(n).to_i).step(2).each { |i| return false if (n % i).zero? }
  true
end

p = gets.strip.to_i
for a0 in (0..p-1)
  n = gets.strip.to_i
  puts is_prime(n) ? 'Prime' : 'Not prime'
end
