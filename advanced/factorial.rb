factorials = Enumerator.new do |result|
  current = 1
  i = 0
  loop do
    result << current
    i += 1
    current *= i
  end
end

7.times do
  puts factorials.next
end

puts "__________________"

puts factorials.first(7)