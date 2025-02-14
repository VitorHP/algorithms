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

puts daily_temperatures([30, 20, 30, 90]).inspect
puts daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73]).inspect
