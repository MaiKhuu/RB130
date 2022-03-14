=begin

P:
- given 2 strings
- count point differences over shortest length
- return integer

E:
- emtpy string is valid, return 0
- always starts at position #0
- does not mutate original strand!
- no validation needed

D:
- class DNA
- method:
  - new: take str => #chars to arr
  - hamming_distance: takes 2nd string

A:
- n = the length of the comparision
    calculate this at hamming_distance
- str.chars to arr
- count differences

=end

class DNA
  def initialize(str)
    @string = str.chars
  end

  def calculate_shortest_distance(str)
    str.length < @string.length ? (str.length - 1) : (@string.length - 1)
  end

  def hamming_distance(str)
    str = str.chars
    n = calculate_shortest_distance(str)
    count = 0
    (0..n).to_a.each do |i|
      count += 1 if @string[i] != str[i]
    end
    count
  end
end
