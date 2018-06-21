ALPHABET = ("a".."z").to_a.join

def remove_special(a_string)
  regexp = Regexp.new("[^#{ALPHABET}]")
  a_string.gsub!(regexp) { "" }
  return a_string
end

def palindrome?(a_string)
  return false if a_string == ""
  final_string = remove_special(a_string.downcase)
  return final_string == final_string.reverse
end
