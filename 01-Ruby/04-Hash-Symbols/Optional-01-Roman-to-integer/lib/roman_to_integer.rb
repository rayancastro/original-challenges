ROMAN_VALUES = { I: 1,
                 V: 5,
                 X: 10,
                 L: 50,
                 C: 100,
                 D: 500,
                 M: 1000 }

def roman_to_integer(roman_string)
  # TODO: translate roman string to integer
  # Set sum to 0, set memo to 0
  sum = 0
  memo = 0
  # Iterate through the string reversed
  roman_string.reverse.each_char do |c|
    # Use char as key and return integer value
    value = ROMAN_VALUES[c.to_sym]
    # Compare value with memo, if its lower subtract from sum, if its higher, add to sum
    value < memo ? sum -= value : sum += value
    # Store value to memo
    memo = value
  end
  return sum
end
