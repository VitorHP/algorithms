require 'debug'

def daily_temperatures(temps)
  answer = Array.new(temps.size) { 0 }
  head = temps.size - 2
  tail = temps.size - 1

  while head >= 0
    if temps[tail] > temps[head]
      answer[head] = tail - head
    else
      tail += 1 while tail < temps.size && temps[tail] <= temps[head]

      answer[head] = tail < temps.size ? tail - head : 0
    end

    head -= 1
    tail = head + 1
  end

  answer
end

# puts daily_temperatures([30, 20, 30, 90]).inspect
# puts daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73]).inspect

def visible_people_in_a_line(heights)
  head = heights.size - 2
  visible_people = [heights.last]
  answer = Array.new(heights.size) { 0 }

  while head >= 0
    (visible_people.size - 1).downto(0) do |i|
      answer[head] += 1

      break if visible_people[i] >= heights[head]
    end

    visible_people.pop while !visible_people.empty? && visible_people.last <= heights[head]
    visible_people.push heights[head]

    head -= 1
  end

  answer
end

puts visible_people_in_a_line([10, 6, 8, 5, 11, 9]).inspect
