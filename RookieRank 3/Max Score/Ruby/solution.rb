#!/bin/ruby

# SLOW SOLUTION

def getScore(a)
  score = 0
  runningSum = 0
  while v = a.pop
    score += runningSum % v
    runningSum += v
  end
  score
end

def getMaxScore(a)
  max = 0
  a.permutation.each do |arr|
    v = getScore(arr)
    max = v if v > max
  end
  max
end

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
maxScore = getMaxScore(a)
puts maxScore
