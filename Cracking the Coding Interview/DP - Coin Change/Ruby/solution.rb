#!/bin/ruby

@memo = {}

def load_memo(coins, target)
  size = coins.size
  if @memo[[size, target]].nil?
    res = 0
    coins.each_with_index do |coin, index|
      new_target = target - coin
      res += dp(coins[index..-1], new_target) if new_target >= 0
    end
    @memo[[size, target]] = res
  end
  @memo[[size, target]]
end

# coins = the usable coins
# target = target value
def dp(coins, target)
  return 0 if coins.size == 0 || target < 0
  return 1 if target == 0
  load_memo(coins, target)
end

n,m = gets.strip.split(' ')
n = n.to_i
m = m.to_i
coins = gets.strip
coins = coins.split(' ').map(&:to_i)

puts dp(coins, n)
