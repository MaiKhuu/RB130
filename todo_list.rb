require 'pry'

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo_item)
    if todo_item.class == Todo
      @todos << todo_item
    else 
      raise TypeError.new("Can only add Todo objects")
    end
  end
  
  alias_method :<<, :add
  
  # def <<(todo_item)
  #   add(todo_item)
  # end

  def to_s
    result = <<~text.chomp
    ---- #{title} ----
    text
    
    @todos.each do |item|
      result << "\n#{item.to_s} "
    end
    
    result
  end
  
  def size
    @todos.size
  end
  
  def first
    @todos.first
  end
  
  def last
    @todos.last
  end
  
  def to_a
    @todos.clone
  end
  
  def done?
    # @todos.each { |item| return false if !item.done? }
    # true
    @todos.all? { |item| item.done? }
  end
  
  def item_at(index = nil)
    raise ArgumentError.new if index.nil?
    raise IndexError.new if !(0..@todos.size-1).include?(index)
    @todos[index]
  end
  
  def mark_done_at(index = nil)
    item_at(index).done!
  end
  
  def mark_undone_at(index = nil)
    item_at(index).undone!
  end
  
  def done!
    @todos.each { |item| item.done! }
  end
  
  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end
  
  def remove_at(index = nil)
    #self.item_at(index)
    #@todos.delete_at(index)
    @todos.delete(item_at(index))
  end
  
  def each(&block)
    index = 0 
    while index < @todos.size
      block.call(@todos[index]) 
      index += 1
    end
    self
  end
  
  def select(&block)
    result = TodoList.new(title)
    @todos.each do |item| 
      result << item if block.call(item)
    end
    result
  end
  
  def find_by_title(matching_title)
    select{ |item| item.title == matching_title }.first 
  end
  
  def all_done
    select{ |item| item.done? } 
  end
  
  def all_not_done
    select{ |item| !item.done? } 
  end
  
  def mark_done(matching_title)
    find_by_title(matching_title).done! if find_by_title(matching_title)
  end
  
  def mark_all_done
    each { |item| item.done! }
  end
  
  def mark_all_undone
    each { |item| item.undone! }
  end
end

# Test casese
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect