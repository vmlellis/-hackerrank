#!/bin/ruby

def prefix_sums(arr, mod)
  sum = 0
  arr.map.with_index do |val, idx|
    sum += val
    [sum % mod, idx]
  end
end

def max_subarray(arr, mod)
  prefix = prefix_sums(arr, mod)
  sorted = prefix.sort_by! { |x, _| x } # sort array of [prefix_sum, index]

  max = 0
  sorted.each_cons(2) do |previous, current| # we want to look at each pair
    # the current prefix_sum is bigger than the previous due to sorting
    if previous[1] > current[1] # only if the previous prefix_sum
                                # occurred after the current
      # so we want to get the greater of:
      #  * the sum of the subarray between the two
      #  * the bigger prefix sum
      between_sum = (previous[0] - current[0]) % mod
      check = [between_sum, current[0]].max
    else # there is no subarray between these two since they are out of order
      check = current[0]
    end
    max = [max, check].max
  end
  max
end

tests = $stdin.gets.to_i

tests.times do
  _, m = $stdin.gets.split(' ').collect(&:to_i)
  arr = $stdin.gets.split(' ').collect(&:to_i)
  puts max_subarray(arr, m)
end
