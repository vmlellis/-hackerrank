#!/bin/ruby

m,n = gets.strip.split(' ').map(&:to_i)
magazine = gets.strip.split(' ')
ransom = gets.strip.split(' ')

hsh_magazine = magazine.each_with_object(Hash.new(0)) do |word, res|
  res[word] += 1
end

def check_words(ransom, hsh_magazine)
  ransom.each do |word|
    return 'No' if hsh_magazine[word] == 0
    hsh_magazine[word] -= 1
  end
  'Yes'
end

puts check_words(ransom, hsh_magazine)
