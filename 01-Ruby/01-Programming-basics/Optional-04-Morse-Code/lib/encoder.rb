def encode(text)
  # TODO: write a method which returns the morse sentence for the given text
  # NOTE: you may want to extract a `encode_word` method
  text.downcase!
  text.delete! "'"
  text.delete! ","
  arr = text.split(' ')
  arr.map! { |word| encode_word(word) }
  text = arr.join('|')
  return text
end

def encode_word(word)
  morse = Hash[a: '.-', b: '-...', c: '-.-.', d: '-..', e: '.', f: '..-.', g: '--.', h: '....', i: '..', j: '.---',
               k: '-.-', l: '.-..', m: '--', n: '-.', o: '---', p: '.--.', q: '--.-', r: '.-.', s: '...', t: '-',
               u: '..-', v: '...-', w: '.--', x: '-..-', y: '-.--', z: '--..']
  word = word.split("").join(" ")
  word.gsub!(/[a-z]/) { |match| morse[match.to_sym] }
  # word.each_char {|char| morse_word += $morse[char.to_sym]}
  return word
end

p encode("Testing this stuff")
