ALPHABET = ("a".."z").to_a.join

def remove_special(a_string)
  regexp = Regexp.new("[^#{ALPHABET}]")
  a_string.gsub!(regexp) { |element| "" }
  return a_string
end

def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
end
