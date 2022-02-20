# Listening Device
# https://launchschool.com/exercises/56a87411

=begin
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      to_be_recorded = yield
      record(to_be_recorded)
    end
  end

  def play
    puts @recordings
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
=end

#-------------------------------------------------------

# Text Analyzer - Sandwich Code
# https://launchschool.com/exercises/c618c0e4

=begin
class TextAnalyzer
  def process
    file = File.open("sample_text.txt")
    text = file.read
    file.close
    yield(text)
  end
end

analyzer = TextAnalyzer.new
analyzer.process{ |text| puts " #{text.split("\n\n").count} paragraphs" }
analyzer.process{ |text| puts " #{text.split("\n").count} lines" }
analyzer.process{ |text| puts " #{text.split(" ").count} words" }
=end

#-------------------------------------------------------

# Passing Parameters Part 1
# https://launchschool.com/exercises/c7f39d55

=begin
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts(yield(items)) if block_given?
  puts "Nice selection of food we have gathered!"
end

gather(items) { |list| list.join(', ') }
=end

#-------------------------------------------------------

# Passing Parameters Part 2
# https://launchschool.com/exercises/8621919c

=begin
def ignore_first_two(arg_array)
  yield(arg_array) if block_given?
end

third_element = ignore_first_two(%w(raven finch hawk eagle)) { |arr| arr[2..-1] }

# Better answer:
third_element_2 = ignore_first_two(%w(raven finch hawk eagle)) { |_, _, *arg| arg }
p third_element_2
=end

#-------------------------------------------------------

# Passing Parameters Part 3
# https://launchschool.com/exercises/c9181c33

=begin
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Problem 1:
gather(items) do |arr|
  puts (arr[0..-2].join(", "))
  puts arr.last
end

# Problem 2
gather(items) do |item1, *item2, item3|
  puts item1
  puts item2.join(", ")
  puts item3
end

# Problem 3
gather(items) do |item1, *item2|
  puts item1
  puts item2.join(", ")
end

# Problem 4
gather(items) do |item1, item2, item3, item4|
  puts "#{item1}, #{item2}, #{item3}, and #{item4}"
end
=end

#-------------------------------------------------------

# Method to Proc
# https://launchschool.com/exercises/ecdb2b22

=begin
def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)
=end

#-------------------------------------------------------

# Bubble Sort with Blocks
# https://launchschool.com/exercises/8a0837d6

def bubble_sort!(array)
  loop do
    swapped = false

    1.upto(array.size - 1) do |index|

      unless block_given?
        next if array[index - 1] <= array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
        swapped = true

      else
        next if yield(array[index - 1], array[index])
        array[index - 1], array[index] = array[index], array[index - 1]
        swapped = true
      end
    end

    break unless swapped
  end
  nil
end
