#!/bin/ruby

# NEED BETTER MEMOIZATION (SLOW SOLUTION)

@cache = {}
def getScore(a)
  middle = a.size / 2
  score = 0
  runningSum = 0
  arr = []

  key = a[0...middle].join(',')
  c = @cache[key]
  if c
    score, runningSum = c
    arr = a[0...middle]
    a = a[middle...a.size]
  end

  while v = a.shift
    score += runningSum % v
    runningSum += v
    arr << v
    @cache[arr.join(',')] ||= [score, runningSum] if arr.size == middle
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
