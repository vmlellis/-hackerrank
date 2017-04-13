#!/bin/ruby

@cache = {}

def combos(n)
  return 0 if n < 0
  return 1 if n == 0
  @cache[n] ||= (1..3).inject(0) { |acc, elem| acc + combos(n - elem) }
end

s = gets.strip.to_i
for a0 in (0..s-1)
  n = gets.strip.to_i
  puts combos(n)
end
