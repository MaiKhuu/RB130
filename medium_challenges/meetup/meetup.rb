=begin

P:
- taking a month and a year and a day of the week and an order
- teenth = 13th - 19th
- return exact date

E:
- case INsensititive
- nil if can't find

D:
- Meetup class
- new: take a year, a month
- day: take strings of  Mon-Sun, first - last, teenth
    return a Date object

=end
require 'date'

class Meetup
  WEEK_ORDER = {
    "first" => 1,
    "second" => 2,
    "third" => 3,
    "fourth" => 4,
    "fifth" => 5
  }

  DAY_ORDER = {
    "monday" => 1,
    "tuesday" => 2,
    "wednesday" => 3,
    "thursday" => 4,
    "friday" => 5,
    "saturday" => 6,
    "sunday" => 7
  }

  def initialize(y, m)
    @year = y
    @month = m
  end

  def find_last_day(day_of_week)
    result = Date.civil(@year, @month, -1)
    result -= 1 while result.cwday != day_of_week
    result
  end

  def find_teenth_day(day_of_week)
    result = Date.civil(@year, @month, 13)
    result += 1 while result.cwday != day_of_week
    result
  end

  def last_month_last_day
    if @month == 1
      Date.civil(@year - 1, 12, -1)
    else
      Date.civil(@year, @month - 1, -1)
    end
  end

  def find_nth_day(day_of_week, n)
    count = 0
    result = last_month_last_day
    while count < n
      result += 1
      count += 1 if result.cwday == day_of_week
    end
    result.month == @month ? result : nil
  end

  def day(d, rule)
    case rule.downcase
    when "last"
      find_last_day(DAY_ORDER[d.downcase])
    when "teenth"
      find_teenth_day(DAY_ORDER[d.downcase])
    else
      find_nth_day(DAY_ORDER[d.downcase], WEEK_ORDER[rule.downcase])
    end
  end
end
