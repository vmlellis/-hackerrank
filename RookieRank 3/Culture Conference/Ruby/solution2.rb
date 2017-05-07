#!/bin/ruby

def getMinimumEmployees(employees, burnouts)
  employees.sort_by! { |x| x.size }
  res = 0
  while connections = employees.pop
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
      # employees.each do |a|
      #   diff = a - burnouts
      #   diff.each { |v| a.delete(v) }
      # end
      # employees.sort_by! { |x| x.size }
    end
  end
  res
end

n = gets.strip.to_i
# Information for employees 1 through n - 1:
# The first value is the employee's supervisor ID
# The second value is the employee's burnout status (0 is burned out, 1 is not)
# e = Array.new(n-1)
employees = Array.new(n) { [] }
burnouts = []
(n-1).times do |i|
  supervisor, burnout = gets.strip.split(' ').map(&:to_i)
  if burnout == 0
    burnouts << i + 1
    employees[i + 1] << i + 1
    employees[supervisor] << i + 1 unless employees[supervisor].include?(i + 1)
  end
  if supervisor > 0 && burnouts.include?(supervisor)
    employees[i + 1] << supervisor
  end
end

# p employees
# p burnouts

minimumEmployees = getMinimumEmployees(employees, burnouts)
puts minimumEmployees
