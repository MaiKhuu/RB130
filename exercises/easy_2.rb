# From-To-Step Sequence Generator
# https://launchschool.com/exercises/ec8dd514

def step(min, max, step_value, &block)
    while min <= max do
        yield(min)
        min += step_value
    end
end

#---------------------------------

# Ziper
# https://launchschool.com/exercises/7c6be14d

def zip(arr1, arr2)
    result = []
    arr1.each_with_index do |item, i|
        result << [item, arr2[i]]
    end
    result
end

#--------------------------------

# Map
# https://launchschool.com/exercises/8341f1f1

def my_map(arr)
    result = []
    arr.each { |item| result << yield(item) } 
    result
end

#--------------------------------

# Count
# https://launchschool.com/exercises/c6c0d9a9

def count(*arg_list)
    result = 0
    arg_list.each { |item| result += 1 if yield(item) }
    result
end

#--------------------------------

# Drop_while
# https://launchschool.com/exercises/f9cb9ad5

def drop_while(arr)
    arr.each_with_index { |item, i| return arr[i..-1] if !yield(item) }
    [] 
end

#--------------------------------

# each_with_index
# https://launchschool.com/exercises/12e1e19c

def my_each_with_index(arr)
    i = 0
    arr.each do |item|
        yield(item, i)
        i += 1
    end
    arr
end

#--------------------------------

# each_with_object
# https://launchschool.com/exercises/a890a029

def my_each_with_object(arg, result)
    arg.each { |item| yield(item, result) }
    result
end

#--------------------------------

# max_by
# https://launchschool.com/exercises/35a94033

def my_max_by(arr)
    max = nil 
    arr.each { |item| max = item if (max.nil? || yield(max) < yield(item)) }
    max
end

#--------------------------------

# each_cons
# https://launchschool.com/exercises/7a2b407e

def my_each_cons_2_element(arr)
    arr.each_with_index do |item, i| 
        next if i == 0 
        yield(arr[i-1], item)
    end
    nil
end

arr[i..i+range-1]
# each_cons (part 2)
# https://launchschool.com/exercises/711c6a89

def each_cons(arr, range)
    arr.each_with_index do |item, i|
        break if (i + range -1) >= arr.size
        yield(item, *arr[i+1..i+range-1])
    end
    nil
end

arr[i..i+range-1]