class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, n = nil)
    @datum = datum
    @next = n
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList < Array
  def push(elem_datum)
    self << if empty?
              Element.new(elem_datum)
            else
              Element.new(elem_datum, head)
            end
  end

  def peek
    empty? ? nil : last.datum
  end

  def head
    empty? ? nil : last
  end

  def pop
    temp = head
    delete_at(-1)
    temp.datum
  end

  def self.from_a(arr)
    result = new
    arr&.reverse&.each { |i| result.push(i) }
    result
  end

  def to_a
    map(&:datum).reverse
  end

  def reverse
    result = self.class.new
    (0..size - 1).to_a.reverse.each do |i|
      result.push(self[i].datum)
    end
    result
  end
end
