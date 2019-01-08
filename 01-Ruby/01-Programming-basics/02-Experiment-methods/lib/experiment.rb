def get_rid_of_surrounding_whitespaces(a_string)
  return a_string.strip
end

def belongs_to?(a_string, a_word)
  return a_string.include? a_word
end

def replace(initial_string, old_letter, new_letter)
  return initial_string.tr(old_letter, new_letter)
end

def exactly_divide(an_integer, a_divider)
  an_integer.fdiv(a_divider)
end

def divisible_by_two?(an_integer)
  return an_integer.even?
end

def random_subset(an_array, sample_size)
  subset = []
  sample_size.times do
    subset.push(an_array[rand(an_array.size)])
  end
  return subset
end

def randomize(an_array)
  return an_array.shuffle
end

def ascending_order(an_array)
  return an_array.sort { |x, y| x <=> y }
end
