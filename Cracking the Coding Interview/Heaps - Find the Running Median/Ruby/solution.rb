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

n = gets.strip.to_i
arr = []
n.times do |i|
  value = gets.strip.to_i
  arr.insert(index_sorted(arr, value), value)

  mid = arr.size / 2
  if arr.size % 2 == 0
    slice = (mid-1...mid+1)
    sum = arr[slice].inject(:+) || 0
    puts (sum / 2.0)
  else
    puts arr[mid].to_f
  end
end
