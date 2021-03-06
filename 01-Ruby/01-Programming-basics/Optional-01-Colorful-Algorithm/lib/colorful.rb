def digits_array(number)
  arr = []
  while number >= 10
    resto = number % 10
    arr.unshift(resto)
    number = number / 10
  end
  arr.unshift(number)
  return arr
end

def colorful_helper(digits_arr)
  if digits_arr.size == 3
    digits_arr.push(digits_arr[0] * digits_arr[1])
    digits_arr.push(digits_arr[1] * digits_arr[2])
    digits_arr.push(digits_arr[0] * digits_arr[1] * digits_arr[2])
  elsif digits_arr.size == 2
    digits_arr.push(digits_arr[0] * digits_arr[1])
  end
  return digits_arr
end

def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  # 123 (first, second, third, first*second, second*third, first*second*third) must be different
  return false unless number.is_a?(Numeric)
  digits = digits_array(number)
  return "Please input a number with up to 3 digits" if digits.size > 3

  colorful = colorful_helper(digits)

  colorful.each_index do |index|
    colorful[index + 1, colorful.size].each do |num|
      return false if colorful[index] == num
    end
  end
  return true
end

puts(colorful?("S"))

