#!/bin/ruby

class Graph
  def initialize(size)
    @size = size
    @edges = Array.new(size) { [] }
  end

  def connect(x, y)
    @edges[x] << y
    @edges[y] << x
  end

  def find_all_distances(start)
    distances = [-1] * @size
    unvisited = [true] * @size

    distances[start] = 0
    unvisited[start] = false

    calculate_distances(start, distances, unvisited)

    distances.delete_at(start)
    distances.join(' ')
  end

  private

  def calculate_distances(start, distances, unvisited)
    queue = [start]
    until queue.empty?
      node = queue.pop
      @edges[node].each do |child|
        next unless unvisited[child]
        distances[child] = distances[node] + 6
        unvisited[child] = false
        queue.unshift(child) # Insert in queue
      end
    end
  end
end

q = gets.strip.to_i
q.times do
  n, m = gets.strip.split(' ').map(&:to_i)
  graph = Graph.new(n)
  m.times do
    x, y = gets.strip.split(' ').map(&:to_i)
    graph.connect(x - 1, y - 1)
  end
  s = gets.strip.to_i
  puts graph.find_all_distances(s - 1)
end
