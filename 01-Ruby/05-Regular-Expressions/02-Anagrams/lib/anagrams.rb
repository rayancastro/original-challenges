ALPHABET = ("a".."z").to_a.join

def char_frequencies(string)
  freq = {}
  string.chars.each do |char|
    (freq.key?(char.downcase) ? freq[char.downcase] += 1 : freq[char.downcase] = 1) if ALPHABET.include?(char.downcase)
  end
  return freq
end

def anagrams?(a_string, another_string)
  first_anagram = a_string.downcase.gsub(/[^#{ALPHABET}]/) { "" }.chars.sort.join
  second_anagram = another_string.downcase.gsub(/[^#{ALPHABET}]/) { "" }.chars.sort.join
  first_anagram == second_anagram
end

def anagrams_on_steroids?(a_string, another_string)
  frequencies_one = char_frequencies(a_string)
  frequencies_two = char_frequencies(another_string)
  frequencies_one == frequencies_two
end

# def test_anagrams(argument_one, argument_two, iterations)
#   sum = 0
#   iterations.times do
#     start = Time.now
#     anagrams?(argument_one, argument_two)
#     finish = Time.now
#     sum += finish - start
#   end
#   return "This method spent %f seconds to computate, on average, after #{iterations} iterations." % (sum / iterations)
# end

# def test_anagrams_on_steroids(argument_one, argument_two, iterations)
#   sum = 0
#   iterations.times do
#     start = Time.now
#     anagrams_on_steroids?(argument_one, argument_two)
#     finish = Time.now
#     sum += finish - start
#   end
#   return "This method spent %f seconds to computate, on average, after #{iterations} iterations." % (sum / iterations)
# end

# puts test_anagrams("Monica Lewinsky!", "Nice silky woman", 100000)
# puts test_anagrams_on_steroids("Monica Lewinsky!", "Nice silky woman", 100000)
