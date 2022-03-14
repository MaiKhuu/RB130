# given a string or octal number, converts to integer decimal
# need to validate 0-7 => returns 0

class Octal
  def valid?
    @oct_num.chars.all? do |chr|
      ("0".."7").include?(chr)
    end
  end

  def initialize(num)
    @oct_num = num
  end

  def to_decimal
    return 0 unless valid?
    result = 0
    power = 1
    (1..@oct_num.length).to_a.reverse.each do |i|
      result += @oct_num[i - 1].to_i * power
      power *= 8
    end
    result
  end
end
