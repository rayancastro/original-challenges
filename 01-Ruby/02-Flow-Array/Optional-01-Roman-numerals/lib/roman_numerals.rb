def add_roman_letters(string, letter, number)
  number.times do
    string += letter
  end
  return string
end

def old_roman_numeral(an_integer)
  roman_letters = ["M", "D", "C", "L", "X", "V", "I"]
  roman_numbers = [1000, 500, 100, 50, 10, 5, 1]
  roman_string = ""
  for i in (0..roman_letters.size - 1)
    roman_string = add_roman_letters(roman_string, roman_letters[i], an_integer / roman_numbers[i])
    an_integer = an_integer % roman_numbers[i]
  end
  return roman_string
end

def new_roman_numeral(an_integer)
  # TODO: translate integer in roman number - modern-style way
end

p old_roman_numeral(423)
