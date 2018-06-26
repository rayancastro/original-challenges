def character_count(text)
  text.size
end

def character_count_excluding_spaces(text)
  text.delete(" ").size
end

def line_count(text)
  text.lines.count
end

def word_count(text)
  text.split.size
end

def sentence_count(text)
  text.split(".").size
end

def paragraph_count(text)
  text.split(".\n").size
end

def average_words_per_sentence(text)
  # words_per_sentence = []
  # text.split(".").each do |sentence|
  #   words_per_sentence.push(word_count(sentence))
  # end
  # words_per_sentence.reduce(:+) / words_per_sentence.size.to_f
  word_count(text) / sentence_count(text).to_f
end

def average_sentences_per_paragraph(text)
  sentence_count(text) / paragraph_count(text).to_f
end

def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  # Receives a string and analyze it
  # Create hash to store all analized information
  result = {}
  # Define character count
  result[:character_count] = character_count(text)
  # Define character count w/o spaces
  result[:character_count_excluding_spaces] = character_count_excluding_spaces(text)
  # Define line count
  result[:line_count] = line_count(text)
  # Define word count
  result[:word_count] = word_count(text)
  # Define sentence count
  result[:sentence_count] = sentence_count(text)
  # Define paragraph count
  result[:paragraph_count] = paragraph_count(text)
  # Define average words per sentence
  result[:average_words_per_sentence] = average_words_per_sentence(text)
  # Define average sentences per paragraph
  result[:average_sentences_per_paragraph] = average_sentences_per_paragraph(text)
  # Returns a hash with the following keys {
  #   character_count: 523,
  #   character_count_excluding_spaces: 463,
  #   line_count: 42,
  #   word_count: 145,
  #   sentence_count: 32,
  #   paragraph_count: 4,
  #   average_words_per_sentence: 4.53,
  #   average_sentences_per_paragraph: 8
  # }
  return result
end
