require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'practice'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
  
  def test_bad_wheels
    skip("tsting for 3 wheels bad")
    car = Car.new
    assert_equal(3, car.wheels)
  end
end