# fixed size sliding window

def max_sum(arr, k)
  max = 0
  sum = arr[0..(k - 1)].sum

  (k..(arr.size - 1)).each do |i|
    sum += arr[i] - arr[i - k]

    max = sum if sum > max
  end

  max
end

# print max_sum([1, 4, 2, 10, 2, 3, 1, 0, 20], 4)

# Variable sliding window

def smallest_sub_with_sum_higher(arr, min_sum)
  head = 0
  tail = 0
  res = nil

  while tail < arr.size
    sum = arr[head..tail].sum

    if sum > min_sum
      res = tail - head if res.nil? || tail - head < res # check and store if passes the condition
      head += 1 if head < tail # increase head if less than tail
    else
      tail += 1 # increase tail if doesn't match condition
    end
  end

  res.nil? ? 0 : res
end

# puts smallest_sub_with_sum_higher([1, 4, 45, 6, 0, 19], 51).inspect
# puts smallest_sub_with_sum_higher([1, 10, 5, 2, 7], 100).inspect

def minimum_window_substring(s, t)
  head = 0
  tail = 0
  freq = t.chars.each_with_object({}) do |char, acc|
    acc[char] = acc[char] ? acc[char] + 1 : 1
  end
  res = nil

  while tail < s.size
    freq[s[tail]] -= 1 unless freq[s[tail]].nil?

    while freq.values.sum.zero?
      res = s[head..tail] if res.nil? || s[head..tail].size < res.size

      freq[s[head]] += 1 unless freq[s[head]].nil?
      head += 1 if head <= tail
    end

    tail += 1
  end

  puts "RES: #{res.nil? ? ' ' : res}"
end

minimum_window_substring('ADOBECODEBANC', 'ABC')
