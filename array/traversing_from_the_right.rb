require 'debug'

def daily_temperatures(temps)
  answer = Array.new(temps.size) { 0 }
  head = temps.size - 2
  tail = temps.size - 1

  while head >= 0
    if temps[tail] > temps[head]
      answer[head] = tail - head
    else
      while tail < temps.size && temps[tail] <= temps[head]
        tail += 1
      end

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
  answer = Array.new(heights.size) { 0 }
  head = heights.size - 2
  tail = heights.size - 1
  current_talest = heights[tail]

  while head >= 0
    answer[head] = 1

    while tail < heights.size && heights[head] > heights[tail]
      if heights[tail] > current_talest
        answer[head] += 1 
        current_talest = heights[tail]
      end

      tail += 1
    end

    head -= 1
    tail = head + 1
    current_talest = 0
  end

  answer
end

puts visible_people_in_a_line([10, 6, 5, 11]).inspect
puts visible_people_in_a_line([10,6,8,5,11,9]).inspect
