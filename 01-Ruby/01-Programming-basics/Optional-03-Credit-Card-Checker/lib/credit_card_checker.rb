def visa?(card)
  # TODO: A visa card starts with a 4
  return card.strip[0] == "4"
end

def mastercard?(card)
  # TODO: A mastercard card starts with a 5
  return card.strip[0] == "5"
end

def valid_card?(card)
  # TODO: Implement the validator. Return true if the card is valid, false otherwise.
  card.delete!(' ')
  card_array = card.to_s.reverse.each_char.map(&:to_i)


end
