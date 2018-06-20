ROMAN_LETTERS = ["M", "D", "C", "L", "X", "V", "I"]
ROMAN_NUMBERS = [1000, 500, 100, 50, 10, 5, 1]

def add_roman_letters(string, letter, number)
  number.times do
    string += letter
  end
  return string
end

def old_roman_numeral(an_integer)
  roman_string = ""
  ROMAN_LETTERS.each_index do |i|
    roman_string = add_roman_letters(roman_string, ROMAN_LETTERS[i], an_integer / ROMAN_NUMBERS[i])
    an_integer = an_integer % ROMAN_NUMBERS[i]
  end
  return roman_string
end

def polish_roman(roman_string)
  roman_hash = Hash["VIV" => "IX", "LXL" => "XC", "DCD" => "CM"]
  roman_string.gsub!(/VIV/) { |match| roman_hash[match] }
  roman_string.gsub!(/LXL/) { |match| roman_hash[match] }
  roman_string.gsub!(/DCD/) { |match| roman_hash[match] }
  return roman_string
end

def new_roman_numeral(an_integer)
  roman_string = ""
  ROMAN_LETTERS.each_index do |i|
    if (an_integer / ROMAN_NUMBERS[i] > 3) && (an_integer < 4000)
      roman_string = add_roman_letters(add_roman_letters(roman_string, ROMAN_LETTERS[i], 1), ROMAN_LETTERS[i - 1], 1)
    else
      roman_string = add_roman_letters(roman_string, ROMAN_LETTERS[i], an_integer / ROMAN_NUMBERS[i])
    end
    an_integer = an_integer % ROMAN_NUMBERS[i]
  end
  return polish_roman(roman_string)
end
