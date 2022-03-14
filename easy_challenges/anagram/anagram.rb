=begin

P: anagrams are words with the same number of letter
- take a string
- a method taking another array of string
- return an array of anagrams of the org. string

E:
- can ignore space safely
- if one answer, still an array of 1 element
- no need to sort arr answer
- anagrams:
  - same number of total letters
  - same letters
  - not case sensitive
  - not identical words

D:
- class Anagram
- method match(array)
- method process (str) = str.chars.sort.join
- method same_word? downcase words the same?

A:
- take 1 string, do not mutate it
- Array#select
- check not same wor
- str.chars.sort.join ==

=end

class Anagram
  def initialize(str)
    @detector = str
  end

  def processed(str)
    str.downcase.chars.sort.join
  end

  def same_word?(str1, str2)
    str1.downcase == str2.downcase
  end

  def match(str_arr)
    str_arr.select do |str|
      !same_word?(str, @detector) && processed(str) == processed(@detector)
    end
  end
end
