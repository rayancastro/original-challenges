VOGALS = "aeiou"
CONSONANTS = ("a".."z").to_a.join.delete VOGALS
SPECIAL = "?<>',?[]}{=-).(*&^%$#`~{}! "
SUFFIXES = ["em", "é", "ji", "oc", "ic", "uche", "ès"]

def word?(word)
  SPECIAL.split("").each do |char|
    return false if word.include? char
  end
  return true
end

def first_consonant_group(word)
  consonant_group = []
  word.split("").each do |char|
    break if VOGALS.include? char
    raise ArgumentError.new, "Detected a symbol that should't be here." if SPECIAL.include? char
    consonant_group.push(char) if CONSONANTS.downcase.include? char
  end
  return consonant_group
end

def louche_word(word)
  # check if it is a word, if not leave unchanged
  if word?(word)
    # checks first letters of word until it matches a vogal and store those letters.
    consonant_group = first_consonant_group(word)
    # check if the word is all consonants. returns word
    return word if consonant_group.size == word.size
    # remove those letters from word
    word = word.sub(consonant_group.join, "")
    # add letter L to beggining of word
    word = "l" + word
    # add stored letters to the end of the word
    consonant_group.each { |char| word += char }
    # add a sufix
    word += SUFFIXES[rand(0..SUFFIXES.size - 1)]
  end
  return word
end

def louchebemize(sentence)
  word_array = sentence.split(/\b/)
  louche_array = []
  # for each word
  word_array.each do |word|
    louche_array.push(louche_word(word))
  end
  return louche_array.join
end

p louchebemize("lets try this sentence")
