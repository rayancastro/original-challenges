def group_anagrams(words)
  # TODO: group anagrams
  # Create empty hash
  anagrams = {}
  # Iterate over the array of strings
  words.each do |word|
    # Store sorted version of word (for computational purposes)
    sorted_word = word.downcase.chars.sort.join
    # For each string, check hash for its sorted version as key:
    if anagrams.key?(sorted_word)
      # If the dictionary does have the key, push string to the value of the key (wich will be an array)
      anagrams[sorted_word].push(word)
    else
      # If the dictionary doesnt have the key, add new key to hash with value equal to an array containing that string
      anagrams[sorted_word] = [word]
    end
  end
  # Return array of values from the dictionary
  return anagrams.values
end
