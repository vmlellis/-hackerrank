#!/bin/ruby

# Search by complements (better to unsorted array)
def search(arr, total)
  comps = {}
  arr.each_with_index do |x, i|
    comp = total - x
    return "#{comps[comp] + 1} #{i + 1}" if comps.key?(comp)
    comps[x] = i
  end
  ''
end

t = gets.strip.to_i
for a0 in (0..t-1)
    m = gets.strip.to_i
    n = gets.strip.to_i
    a = gets.strip
    a = a.split(' ').map(&:to_i)
    puts search(a, m)
end
