# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc # => #<Proc:0x093...>
puts my_proc.class # => Proc
my_proc.call # => "This is a"
my_proc.call('cat') # ="This is a cat"

# Proc has lenient arity. no argument given = assumed nil

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda # => #<Proc:0x093...> (lambda)
puts my_second_lambda # => #<Proc:0x093...> (lambda)
puts my_lambda.class # => Proc
my_lambda.call('dog') # => "This is a dog"
# my_lambda.call # => ERROR
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# => can't make a Lambda object because it's actually a Proc

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# => "This is a"

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# => "This is a turtle"

block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# => "This is a turtle and a"

block_method_2('turtle') { puts "This is a #{animal}."}
# => ERROR: animal is not initialized