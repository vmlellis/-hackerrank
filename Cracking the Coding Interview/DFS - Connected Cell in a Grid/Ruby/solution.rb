#!/bin/ruby

RANGE = [-1, 0, 1].freeze

def no_path?(grid, i, j)
  i >= grid.size || j >= grid[0].size || i < 0 || j < 0 || grid[i][j].zero?
end

def DFS(grid, i, j)
  return 0 if no_path?(grid, i, j) || grid[i][j] == -1
  grid[i][j] = -1 # mark as visited
  count = 1
  RANGE.each do |x|
    RANGE.each { |y| count += DFS(grid, i + x, j + y) }
  end
  count
end

def biggest_region(grid, n, m)
  res = 0
  n.times do |i|
    m.times do |j|
      next unless grid[i][j] == 1
      count = DFS(grid, i, j)
      res = count if count > res
    end
  end
  res
end

n = gets.strip.to_i
m = gets.strip.to_i
grid = Array.new(n)
for grid_i in (0..n-1)
  grid_t = gets.strip
  grid[grid_i] = grid_t.split(' ').map(&:to_i)
end

puts biggest_region(grid, n, m)
