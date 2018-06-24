ALPHABET = (("a".."z").to_a + ("A".."Z").to_a).join
def noise_hash(stop_words_file_name)
  noise = { "" => 1 }
  File.open(stop_words_file_name, "r").each_line do |line|
    line.split.each { |word| noise[word] = 1 }
  end
  return noise
end

def most_common_words(file_name, stop_words_file_name, number_of_word)
  noise = noise_hash(stop_words_file_name)
  frequencies = {}
  # Open the file and read each line
  File.open(file_name, "r").each_line do |line|
    # Separate the words
    line.split(/[^#{ALPHABET}]/).each do |word|
      word.downcase!
      # Get rid of the noise, and for each word, add 1 to its value at the frequencies hash
      (frequencies.key?(word) ? frequencies[word] += 1 : frequencies[word] = 1) unless noise.key?(word)
    end
  end
  # Return a hash with the number_of_word most frequent words
  frequencies.select { |_key, value| value >= frequencies.values.sort[number_of_word * -1] }
end
