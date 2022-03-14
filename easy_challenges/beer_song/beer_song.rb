class BeerSong
  def self.verse(n)
    result = first_line_starter(n) + "of beer on the wall, "
    result += first_line_ender(n) + "of beer.\n"
    result += second_line_starter(n)
    result + second_line_ender(n) + "of beer on the wall.\n"
  end

  def self.verses(starting, ending)
    result = ""
    (ending..starting).to_a.reverse.each do |i|
      result << verse(i)
      result << "\n"
    end
    result.chop
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def counter(n)
      case n
      when 0
        "no more bottles "
      when 1
        "1 bottle "
      else
        "#{n} bottles "
      end
    end

    def first_line_starter(n)
      n.zero? ? "No more bottles " : counter(n)
    end

    def first_line_ender(n)
      counter(n)
    end

    def second_line_ender(n)
      n.zero? ? counter(99) : counter(n - 1)
    end

    def second_line_starter(n)
      case n
      when 0
        "Go to the store and buy some more, "
      when 1
        "Take it down and pass it around, "
      else
        "Take one down and pass it around, "
      end
    end
  end
end
