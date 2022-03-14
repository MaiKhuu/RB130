=begin

P:
- given decimal
- returns string roman num

E:
- num <= 3000
- list of roman nums:
    I = 1
    V = 5
    X = 10
    L = 50
    C = 100
    D = 500
    M = 1000

D:
- class RomanNumeral
- method: to_roman => return string

A:
- Hash constant roman => decimal from largest down
- num - roman num if num >= roman num
    add roman letter to result

=end

class RomanNumeral
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(num)
    @decimal = num
  end

  def to_roman
    result = ""
    num = @decimal
    ROMAN_NUMERALS.each do |r, d|
      while num >= d
        result << r
        num -= d
      end
    end
    result
  end
end
