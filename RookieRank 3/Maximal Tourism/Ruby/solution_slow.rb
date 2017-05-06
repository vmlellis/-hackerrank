#!/bin/ruby

# SLOW SOLUTION

def path(nodes, index)
  arr = []
  arr << index
  to_verify = nodes[index]
  while v = to_verify.shift
    next if arr.include?(v)
    arr << v
    to_verify.concat(nodes[v])
  end
  arr
end

@cache = {}
def path_size(nodes, index)
  return @cache[index] if @cache[index]
  nodes_path = path(nodes, index)
  nodes_path.each { |i| @cache[i] ||= nodes_path.size }
  @cache[index] ||= nodes_path.size
end

n, m = gets.strip.split(' ').map(&:to_i)

nodes = Array.new(n) { [] }

route = {}
m.times do |i|
  a, b = gets.strip.split(' ').map(&:to_i)
  nodes[a - 1] << b - 1 unless nodes[a - 1].include?(b - 1)
  nodes[b - 1] << a - 1 unless nodes[b - 1].include?(a - 1)
end

max = 0
arr = Array.new(n) { |i| i }
while i = arr.shift
  size = path_size(nodes, i)
  max = size if size > max
  break if max > (n / 2.0)
end

puts max
