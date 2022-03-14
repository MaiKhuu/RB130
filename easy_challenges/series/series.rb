# take string of int
# return arr of arr of int

class Series
  def initialize(string)
    @org_series = string.chars.map(&:to_i)
  end

  def slices(num)
    result = []
    unless !valid_slice_number?(num)
      (0..@org_series.length - num).to_a.each do |i|
        result << @org_series[i..i + num - 1]
      end
    end
    result
  end

  private

  def valid_slice_number?(num)
    raise ArgumentError if num > @org_series.length
    true
  end
end
