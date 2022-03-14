class Robot
  attr_accessor :name

  @@taken_robot_names = []

  def generate_name
    output = ""
    2.times { output << ("A".."Z").to_a.sample }
    3.times { output << ("0".."9").to_a.sample }
    output
  end

  def initialize
    loop do
      @name = generate_name
      break unless @@taken_robot_names.include?(@name)
    end
    @@taken_robot_names << @name
  end

  def reset
    @@taken_robot_names.delete(@name)
    initialize
  end
end
