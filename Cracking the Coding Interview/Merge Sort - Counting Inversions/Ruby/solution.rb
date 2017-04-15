#!/bin/ruby

def count_swaps(arr)
  res =  merge_sort(arr)
  res[:count]
end

def merge_sort(arr)
  return { count: 0, result: arr } if arr.size < 2
  mid = arr.size / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  left_sort = merge_sort(left)
  right_sort = merge_sort(right)
  merge = merge(left_sort[:result], right_sort[:result])

  count = left_sort[:count] + right_sort[:count] + merge[:count]
  { count: count, result: merge[:result] }
end

def merge(left, right)
  res = []
  count = 0

  while left.size > 0 && right.size > 0
    if left[0] <= right[0]
      res << left.shift
    else
      res << right.shift
      count += left.size
    end
  end

  { count: count, result: res.concat(left).concat(right) }
end

t = gets.strip.to_i
for a0 in (0..t-1)
    n = gets.strip.to_i
    arr = gets.strip
    arr = arr.split(' ').map(&:to_i)
    puts count_swaps(arr)
end
