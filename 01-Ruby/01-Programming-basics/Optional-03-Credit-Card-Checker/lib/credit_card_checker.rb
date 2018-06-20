def visa?(card)
  # TODO: A visa card starts with a 4
  return card.strip[0] == "4"
end

def mastercard?(card)
  # TODO: A mastercard card starts with a 5
  return card.strip[0] == "5"
end

def valid_card?(card)
  card.delete!(' ')
  return false if card.length < 16
  card_array = card.to_s.reverse.each_char.map(&:to_i)
  (0...card_array.length).step(2).each do |index|
    card_array[index] *= 2
    card_array[index] -= 9 if card_array[index] >= 10
  end
  sum_array = 0
  card_array[0, card_array.size - 1].each { |element| sum_array += element }
  return (sum_array % 10).zero?
end
