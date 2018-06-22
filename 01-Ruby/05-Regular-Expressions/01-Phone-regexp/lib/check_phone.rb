def french_phone_number?(phone_number)
  num_string = phone_number.gsub(/[ -]/) { "" }
  return false if num_string[1] == "0"
  (num_string[0] == "0" && num_string.size == 10) || (num_string[0..2] == "+33" && num_string.size == 12)
end

# p french_phone_number?("+33 6 65 36 36 36")
# p french_phone_number?("0665363636")
# p french_phone_number?("06-65-36-36-36")
# p french_phone_number?("06 65 36 36")
