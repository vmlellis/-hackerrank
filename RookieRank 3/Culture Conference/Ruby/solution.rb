#!/bin/ruby

# SLOW SOLUTION

def getMinimumEmployees(e)
  burnouts = []
  arr = Array.new(e.size + 1) { [] }
  e.each_with_index do |v, i|
    supervisor = v[0]
    burnout = v[1]
    if burnout == 0
      burnouts << i + 1
      arr[i + 1] << i + 1
      arr[supervisor] << i + 1 unless arr[supervisor].include?(i + 1)
    end
    if supervisor > 0 && e[supervisor - 1][1] == 0
      arr[i + 1] << supervisor
    end
  end
  p burnouts
  p arr
  arr.sort_by! { |x| x.size }
  res = 0
  while connections = arr.pop
    next if connections.empty?
    goToConference = false
    connections.each do |v|
      next unless burnouts.include?(v)
      burnouts.delete(v)
      goToConference = true
    end
    if goToConference
      res += 1
      # Sort again
      arr.each do |a|
        diff = a - burnouts
        diff.each { |v| a.delete(v) }
      end
      arr.select { |x| !x.empty? }.sort_by! { |x| x.size }
    end
  end
  res
end

n = gets.strip.to_i
# Information for employees 1 through n - 1:
# The first value is the employee's supervisor ID
# The second value is the employee's burnout status (0 is burned out, 1 is not)
e = Array.new(n-1)
for e_i in (0..n-1-1)
  e_t = gets.strip
  e[e_i] = e_t.split(' ').map(&:to_i)
end
minimumEmployees = getMinimumEmployees(e)
puts minimumEmployees
