=begin

P: enter 3 sides, need to determine what kind of triangle
it is
- equilateral: 3 sides the same
- isosceles: 2 sides the same, 3rd different
- scalene: no side the same

- validate valid triangle: a+b > c
- invalid: length <= 0,

E:
- side <=0 : ArgumentError
- side1 + side2 <= side 3 : ArgumentError

D: class Triangle
- @side = array[0..2]
- Method:
    - new
    - kind => return equilateral, isosceles,
              or scalene
    -
A:
- test for side >0
- test for inequality
- check for triangle kind:
    - side = side = side
    - side = side, or side = side, or side = side
    - else

=end

class Triangle
  def initialize(*sides)
    @side = sides
    @side[3] = @side[0]
    @side[4] = @side[1]
    raise ArgumentError, "Invalid triangle lengths" unless valid_triangle?
  end

  def non_positive_side?
    @side.each do |s|
      return true if s <= 0
    end
    false
  end

  def inequal?
    [0, 1, 2].each do |i|
      return true if @side[i] + @side[i + 1] <= @side[i + 2]
    end
    false
  end

  def valid_triangle?
    return false if non_positive_side? || inequal?
    true
  end

  def equilateral?
    return true if @side[0] == @side[1] && @side[1] == @side[2]
    false
  end

  def isosceles?
    [0, 1, 2].each do |i|
      return true if @side[i] == @side[i + 1]
    end
    false
  end

  def kind
    return "equilateral" if equilateral?
    return "isosceles" if isosceles?
    "scalene"
  end
end
