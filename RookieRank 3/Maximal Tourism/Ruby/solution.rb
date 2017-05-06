#!/bin/ruby

n, m = gets.strip.split(' ').map(&:to_i)

connectors = []
counters = {}
current = 0
nodes = Array.new(n) { 0 }

route = {}
m.times do |i|
  a, b = gets.strip.split(' ').map(&:to_i)
  if nodes[a - 1] == 0 && nodes[b - 1] == 0
    current += 1
    nodes[a - 1] = current
    nodes[b - 1] = current
    counters[current] = 2
  elsif nodes[a - 1] == 0 && nodes[b - 1] != 0
    nodes[a - 1] = nodes[b - 1]
    counters[nodes[b - 1]] += 1
  elsif nodes[b - 1] == 0 && nodes[a - 1] != 0
    nodes[b - 1] = nodes[a - 1]
    counters[nodes[a - 1]] += 1
  else
    x = nodes[a - 1]
    y = nodes[b - 1]

    ix = connectors.find_index { |c| c.include?(x) }
    iy = connectors.find_index { |c| c.include?(y) }
    if ix.nil? && iy.nil?
      connectors << [x, y] unless x == y
    elsif ix.nil? && !iy.nil?
      connectors[iy] << x
    elsif iy.nil? && !ix.nil?
      connectors[ix] << y
    elsif ix != iy
      connectors[ix].concat(connectors[iy])
      connectors.delete_at(iy)
    end
  end
end

max = counters.values.max || 1
connectors_max = connectors.map { |c| c.map { |v| counters[v] }.sum }.max || 0
max = connectors_max if connectors_max > max
puts max
