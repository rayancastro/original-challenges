def binary_conversor(num)
  # Enter a decimal number and returns a string with the corresponding binary number
  if num <= 1
    return num.to_s
  else
    return binary_conversor(num / 2).to_s + (num % 2).to_s
  end
end

def fill_n_bit(num, number_bits)
  # Enter a string binary number with less than number_bits bits and fill with zeros until it has n digits
  num.insert(0, '0') until num.length >= number_bits
  return num
end

def binary_to_num(bin)
  bin_array = bin.to_s.reverse.each_char.map(&:to_i)
  decimal = 0
  bin_array.each_index do |index|
    decimal += bin_array[index]*(2**index)
  end
  return decimal
end



def ip_to_num(ip_address)
  str_arr = ip_address.to_s.split(".")
  ip_string = ""
  str_arr.each do |element|
    ip_string += fill_n_bit(binary_conversor(element.to_i), 8)
  end
  # TODO: return the number version of the `ip_address` string
  return binary_to_num(ip_string)
end

def num_to_ip(number)
  binary_string = binary_conversor(number)
  fill_n_bit(binary_string,32)
  bin_array = []
  (0...binary_string.length).step(8) do |x|
    bin_array.push(binary_string[x,8])
  end
  bin_array.map!{ |element| binary_to_num(element) }
  ip_string = bin_array.join(".")
  return ip_string
end

p num_to_ip(ip_to_num("37.160.113.170"))

