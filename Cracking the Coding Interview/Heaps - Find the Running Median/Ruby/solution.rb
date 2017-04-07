#!/bin/ruby

# PS: Possível resolver com ruby?

class Box
  attr_reader :higher, :lower, :size, :list, :counter

  def initialize
    @list = []
    @counter = {}
    @higher = nil
    @lower = nil
    @size = 0
  end

  def add(number)
    insert(number) if @counter[number].nil?
    @counter[number] ||= 0
    @counter[number] += 1
    @higher = number if @higher.nil? || number > @higher
    @lower = number if @lower.nil? || number < @lower
    @size += 1
  end

  def remove_higher
    @size -= 1
    @counter[@higher] -= 1
    return if @counter[@higher] > 0
    @list.delete(@higher)
    @higher = @list.to_a.last
  end

  def remove_lower
    @size -= 1
    @counter[@lower] -= 1
    return if @counter[@lower] > 0
    @list.delete(@lower)
    @lower = @list.to_a.first
  end

  private

  def insert(value)
    if @size == 0 || value > @higher
      @list << value
    else
      if value < @lower
        @list.insert(0, value)
      else
        binary_insert(value)
      end
    end
  end

  def binary_insert_at(value)
    x = [*@list.each_with_index].bsearch { |x, _| x > value }
    return @list.size if x.nil?
    x.last
  end

  def binary_insert(value)
    index = binary_insert_at(value)
    @list.insert(index, value)
  end
end

def rebalance(lowers, highers)
  return if highers.size == lowers.size || highers.size == lowers.size - 1
  while highers.size > lowers.size
    value = highers.lower
    highers.remove_lower
    lowers.add(value)
  end
  while lowers.size > highers.size + 1
    value = lowers.higher
    lowers.remove_higher
    highers.add(value)
  end
end

def add_value(lowers, highers, value)
  if lowers.size == 0 || lowers.higher >= value
    lowers.add(value)
  else
    highers.add(value)
  end
  rebalance(lowers, highers)
end

def median(lowers, highers)
  return lowers.higher.to_f if lowers.size > highers.size
  (lowers.higher + highers.lower) / 2.0
end

lowers = Box.new
highers = Box.new

n = gets.strip.to_i
res = []
n.times do |i|
  value = gets.strip.to_i
  add_value(lowers, highers, value)
  res << median(lowers, highers)
  if i % 20000 == 0
    puts res
    res = []
  end
end
puts res if res.size > 0
