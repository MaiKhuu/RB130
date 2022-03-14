=begin

P: write a clock class that == when same time

E:
- 24:00 time

D:
- self.at == initialize
  -  takes an integer for hour, an optional integer for min
- to_s : returns a string HH:MM

- + : add by minutes
  - return a Clock object
- - : subtract by minutes (can do + negative?)

- Notes:
  - 0 hour is 24:00
  - of course minute cannot exceed 59
  - wrap around at midnight

A:
- col object? minutes?
- change time all to minutes?

=end

class Clock
  attr_reader :hour, :minute

  def initialize(h, m)
    @hour = h
    @minute = m
  end

  def self.at(h, m = 0)
    new(h, m)
  end

  def to_s
    format("%02d:%02d", @hour, @minute)
    # result = @hour >= 10 ? @hour.to_s : "0#{@hour}"
    # result += ":"
    # result + (@minute >= 10 ? @minute.to_s : "0#{@minute}")
  end

  def current_total_minutes
    @hour * 60 + @minute
  end

  def total_hour(min)
    result = min / 60
    result % 24
  end

  def left_over_min(min)
    min % 60
  end

  def +(extra_min)
    new_clock_time = current_total_minutes + extra_min
    self.class.new(total_hour(new_clock_time), left_over_min(new_clock_time))
  end

  def -(substracting_min)
    new_clock_time = current_total_minutes - substracting_min
    new_clock_time += 1440 while new_clock_time <= 0
    self.class.new(total_hour(new_clock_time), left_over_min(new_clock_time))
  end

  def ==(another_clock)
    current_total_minutes == another_clock.current_total_minutes
  end
end
