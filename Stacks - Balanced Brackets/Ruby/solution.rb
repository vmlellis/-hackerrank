#!/bin/ruby

BRACKETS_MAP = { '{' => '}', '[' => ']', '(' => ')' }.freeze

def balanced?(brackets)
  arr = []
  total = brackets.size
  brackets.chars.each_with_index do |bracket, index|
    if BRACKETS_MAP.key?(bracket)
      arr << bracket
    else
      return 'NO' unless bracket == BRACKETS_MAP[arr.pop]
    end
  end
  return 'NO' if arr.size > 0
  'YES'
end

t = gets.strip.to_i
for a0 in (0..t-1)
  expression = gets.strip
  puts balanced?(expression)
end
