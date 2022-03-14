class PerfectNumber
  def self.classify(num)
    raise StandardError if num <= 0
    aliquot_sum = divisors(num).sum
    return "deficient" if aliquot_sum < num
    return "perfect" if aliquot_sum == num
    "abundant"
  end

  class << self
    private

    def divisors(num)
      result = [1]
      (2..num / 2).to_a.each do |i|
        result << i if num % i == 0
      end
      result
    end
  end
end
