def longest_palindrome(s)
  longest = ''
  current = ''
  range = 0

  0.upto(s.length - 1) do |i|
    current = s[i]

    until (p = check_odd_palindrome(s, i, range)).empty?
      current = p if p.size > current.size
      range += 1
    end

    range = longest.size
    longest = current if current.size > longest.size
    current = ''

    until (p = check_even_palindrome(s, i, range)).empty?
      current = p if p.size > current.size
      range += 1
    end

    range = longest.size
    longest = current if current.size > longest.size
    current = ''
  end

  longest
end

def check_even_palindrome(s, index, range)
  return '' if index == s.length

  s[index - range] == s[index + range + 1] ? s[(index - range)..(index + range + 1)] : ''
end

def check_odd_palindrome(s, index, range)
  return '' if index == 0 || index == s.length

  s[index - range - 1] == s[index + range + 1] ? s[(index - range - 1)..(index + range + 1)] : ''
end

puts longest_palindrome('ccd')
# puts check_even_palindrome('ccd', 0, 0)
# puts check_odd_palindrome('babab', 2, 2)
