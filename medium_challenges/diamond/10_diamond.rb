class Diamond
  attr_accessor :n, :char, :output

  def self.calculate_n
    @n = @char.ord - 65
  end

  def self.letter_at_row(num)
    (65 + num).chr
  end

  def self.outer_spaces_at_row(num)
    " " * (@n - num)
  end

  def self.inner_spaces_at_row(num)
    return "" if num == 0
    " " * (num * 2 - 1)
  end

  def self.setup(string)
    @char = string[0]
    calculate_n
    @output = ""
  end

  def self.add_row(num)
    @output << if num == 0
                 outer_spaces_at_row(num) + "A" +
                 outer_spaces_at_row(num) + "\n"
               else
                 outer_spaces_at_row(num) +
                 letter_at_row(num) +
                 inner_spaces_at_row(num) +
                 letter_at_row(num) +
                 outer_spaces_at_row(num) + "\n"
               end
  end

  def self.first_half
    (0..@n).to_a.each do |i|
      add_row(i)
    end
  end

  def self.second_half
    (0..@n - 1).to_a.reverse.each do |i|
      add_row(i)
    end
  end

  def self.make_diamond(string)
    setup(string)
    first_half
    second_half
    @output
  end
end
