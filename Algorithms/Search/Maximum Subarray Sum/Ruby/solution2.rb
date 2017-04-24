#!/bin/ruby

def index_sorted(a, x, lo=0, hi=a.size)
  while lo < hi
    mid = (lo + hi) / 2
    if x < a[mid]
      hi = mid
    else
      lo = mid + 1
    end
  end

  lo >= a.size ? a.size : lo
end

def max_mod(arr, mod)
  sums = [0] * (arr.size + 1)
  acc = 0
  done = []
  (0...sums.size).each do |i|
    if i > 0
      sums[i] = sums[i - 1] + arr[i - 1]
    end
    sum = sums[i]
    x = sum % mod
    acc = x if x > acc

    j = index_sorted(done, x)
    if j < i
      v = (sum - done[j]) % mod
      acc = v if v > acc
    end
    done.insert(j, x)
  end
  acc
end

q = gets.strip.to_i
q.times do
  n, m = gets.strip.split(' ').map(&:to_i)
  a = gets.split(' ').map(&:to_i)
  puts max_mod(a, m)
end
