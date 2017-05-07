#!/bin/ruby

@max_scores = []
def populateMaxScores(a, score = 0, runningSum = 0)
  a.size.times do |i|
    new_a = a.dup
    v = new_a.delete_at(i)
    populateMaxScores(new_a, score + runningSum % v, runningSum + v)
  end
  @max_scores << score if a.empty?
end

def getMaxScore(a)
  populateMaxScores(a)
  @max_scores.max || 0
end

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
maxScore = getMaxScore(a)
puts maxScore
