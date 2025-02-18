def search(nums, target)
  inner_search(nums, target, 0)
end

def inner_search(nums, target, offset)
  return -1 if nums.to_a.empty?
  return nums.first == target ? 0 + offset : -1 if nums.size == 1
  return !nums.index(target).nil? ? nums.index(target) + offset : -1 if nums.size == 2

  l = nums[0..(nums.length / 2)]
  r = nums[(nums.length / 2 + 1)..(nums.length - 1)]

  res = if (l.first > l.last && (target >= l.first || target <= l.last)) ||
           (l.first < l.last && (target >= l.first && target <= l.last))
          inner_search(l, target, 0)
        else
          inner_search(r, target, nums.length / 2 + 1)
        end

  res == -1 ? -1 : offset + res
end

puts search([4, 5, 6, 7, 0, 1, 2], 0)
