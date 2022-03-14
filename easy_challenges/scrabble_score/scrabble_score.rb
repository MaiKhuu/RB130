class Scrabble
  SCORE_CHART = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def initialize(word)
    @word = word
  end

  def point_for_char(chr)
    SCORE_CHART.each do |k, v|
      return v if k.include?(chr.upcase)
    end
    0
  end

  def score
    return 0 if @word.nil?
    total = 0
    @word.chars.each do |chr|
      total += point_for_char(chr)
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
