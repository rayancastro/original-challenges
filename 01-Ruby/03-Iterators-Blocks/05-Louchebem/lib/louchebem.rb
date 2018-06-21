def is_word?(word)
  special = "?<>',?[]}{=-).(*&^%$#`~{}!"
  special.split("").each do |char|
    return false if word.include? char
  end
  return true
end

def louchebemize(sentence)
  suffixes = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
  word_array = sentence.split(/\b/)

  # for each word
  word_array.each do |word|
    # check if it is a word, if not leave unchanged
    if is_word?(word)
      # checks first letters of word until it matches a vogal
        word.split("").each do |char|
          break if char.include

      # store those letters
      # remove thos letters
      # add letter L to beggining of word
      # add stored letters to the end of the word
      # add a sufix
    end

  end


end

p is_word?("abcde.")
