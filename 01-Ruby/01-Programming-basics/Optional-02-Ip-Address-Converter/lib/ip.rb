def binary_conversor(num)
  if num <= 1
    return num.to_s
  else
    return binary_conversor(num/2).to_s + (num%2).to_s
  end
end

def fill_8bit(num)
  until num.length >= 8
    num.insert(0, '0')
  end
  return num
end



def ip_to_num(ip_address)
  str_arr = ip_address.to_s.split(".")
  ip_string = ""
  str_arr.each do |element|
    ip_string += fill_8bit(binary_conversor(element.to_i))
  end
  # TODO: return the number version of the `ip_address` string
  puts ip_string
end

def num_to_ip(number)
  # TODO: return the string IP address from the `number`
end

puts ip_to_num("37.160.113.170")

