=begin
# Enumberable Class Creation
# https://launchschool.com/exercises/583a1348

class Tree
    include Enumerable
    
    def each
        # instructions on how to iterate
    end
    
    def <=>
        # instructions on how to compare items
    end
end
=end

#-------------------------------------------------------

=begin
# Optional Blocks
# https://launchschool.com/exercises/1e706bb0

def compute
    block_given? ? yield : "Does not compute."
end

# Further Exploration

def compute_with_arg(argument)
    block_given? ? yield(argument) : "Does not compute."
end

p compute_with_arg(10) { |num| (5 + 3) * num } == 80
p compute_with_arg('String') { |pre_word| pre_word + 'a' + 'b' } == 'Stringab'
p compute_with_arg(1) == 'Does not compute.'
=end

#-------------------------------------------------------

=begin
# Find Missing Numbers
# https://launchschool.com/exercises/a0a4a3d4
+_____+
def missing(arr)
    (arr.first..arr.last).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
=end

#-------------------------------------------------------

=begin
# Divisors 
# https://launchschool.com/exercises/8b99f281

include Math
# def divisors(num)
#     arr = []
#     (1..Math.sqrt(num)).to_a.each do |i|
#         if num % i == 0 
#             arr << i 
#             arr << num / i
#         end
#     end
#     arr.uniq.sort
# end

def divisors(num)
    result = []
    (1..Math.sqrt(num)).to_a.each { |i| result << i if num % i == 0}
    result += result.map { |item| num / item}
    result.uniq.sort
end
=end

#--------------------------------------

=begin
# Encrypted Pioneer
# https://launchschool.com/exercises/6990f3dc

def rot13(str)
    keys = {}
    ("a".."m").to_a.each do |char| 
        keys[char] = (char.ord+13).chr
        keys[char.upcase] = keys[char].upcase
        keys[keys[char]] = char
        keys[keys[char].upcase] = char.upcase
    end
    result = ""
    str.chars.each do |let|
        ("a".."z").include?(let.downcase) ? result << keys[let] : result << let
    end
    result
end
=end

#------------------------------------

=begin
# True for Any?
# https://launchschool.com/exercises/944b8310

def my_any?(arr) #Note that there is no explicit block argument
    arr.each { |item| return true if yield (item) }
    false
end
=end

#------------------------------------

=begin
# True for All?
# https://launchschool.com/exercises/9c2b1d27

def my_all?(arr)
    arr.each { |item| return false if !yield(item) }
    true
end
=end

#------------------------------------

=begin
# True for None? 
# https://launchschool.com/exercises/11204cc9

def my_none?(arr, &block)
    return false if my_any?(arr, &block)
    true
end
=end

#------------------------------------

=begin
# True for One
# https://launchschool.com/exercises/ea073d36

def other_one?(arr, &block)
    arr.each_with_index do |item, i| 
        new_arr = arr.clone
        new_arr.delete_at(i)
        return true if yield(item) && my_none?(new_arr, &block)
    end
    false
end

def one?(arr)
    count = 0
    arr.each do |item|
        count += 1 if yield(item)
        return false if count == 2
    end
    count == 1
end
=end

#------------------------------------

=begin
# Count item
# https://launchschool.com/exercises/1318cb92

def count(arr)
    result = 0
    arr.each {|item| result += 1 if yield(item)}
    result
end
=end