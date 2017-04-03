#!/bin/ruby

a = gets.strip
b = gets.strip

hsh_a = Hash.new(0)
hsh_b = Hash.new(0)

a.each_char { |c| hsh_a[c] += 1 }
b.each_char { |c| hsh_b[c] += 1 }

hsh_a.each do |k, v1|
  next unless hsh_b.key?(k)
  v2 = hsh_b[k]
  if v1 > v2
    hsh_b[k] = 0
    hsh_a[k] -= v2
  else
    hsh_a[k] = 0
    hsh_b[k] -= v1
  end
end

total_a = hsh_a.values.inject(:+) || 0
total_b = hsh_b.values.inject(:+) || 0

puts (total_a + total_b)
