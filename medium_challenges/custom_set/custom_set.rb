class CustomSet
  attr_reader :num_arr

  def initialize(value = [])
    @num_arr = value
  end

  def empty?
    @num_arr.empty?
  end

  def contains?(element)
    @num_arr.include?(element)
  end

  def subset?(another_set)
    @num_arr.all? { |num| another_set.contains?(num) }
  end

  def disjoint?(another_set)
    return true if empty? || another_set.empty?
    @num_arr.none? { |num| another_set.contains?(num) }
  end

  def eql?(another_set)
    @num_arr.uniq.sort == another_set.num_arr.uniq.sort
  end

  def ==(another_set)
    eql?(another_set)
  end

  def add(extra_num)
    @num_arr << extra_num
    self
  end

  def intersection(another_set)
    result = self.class.new
    @num_arr.each { |num| result.add(num) if another_set.contains?(num) }
    result
  end

  def difference(another_set)
    result = self.class.new
    @num_arr.each { |num| result.add(num) if !another_set.contains?(num) }
    result
  end

  def union(another_set)
    result = another_set.clone
    @num_arr.each { |num| result.add(num) if !another_set.contains?(num) }
    result
  end
end
