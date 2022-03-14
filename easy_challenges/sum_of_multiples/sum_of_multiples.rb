# take 1 num, and an array of num defaul [3,5]

class SumOfMultiples
  def initialize(*arr)
    @num_arr = arr
  end

  def to(num)
    result = []
    @num_arr.each do |i|
      result << valid_multiple_of(i, num)
    end
    result.flatten.uniq.sum
  end

  def valid_multiple_of(num, limit)
    result = []
    i = num
    while i < limit
      result << i
      i += num
    end
    result
  end

  def self.to(num)
    new(3, 5).to(num)
  end
end
