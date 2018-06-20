def decode(morse_text)
  # TODO: Decode the morse text you just got!
  morse_array = morse_text.split("|")
  morse_array.map! { |e| decode_word(e) }
  text = morse_array.join(" ")
  return text
end

def decode_word(morse_word)
  morse = Hash['.-' => "a", '-...' => "b", '-.-.' => "c", '-..' => "d", '.' => "e", '..-.' => "f", '--.' => "g",
               '....' => "h", '..' => "i", '.---' => "j", '-.-' => "k", '.-..' => "l", '--' => "m", '-.' => "n",
               '---' => "o", '.--.' => "p", '--.-' => "q", '.-.' => "r", '...' => "s", '-' => "t",
               '..-' => "u", '...-' => "v", '.--' => "w", '-..-' => "x", '-.--' => "y", '--..' => "z"]

  letter_array = morse_word.split(" ")
  word = ""
  letter_array.each { |letter| word += morse[letter] }
  return word.upcase
end
