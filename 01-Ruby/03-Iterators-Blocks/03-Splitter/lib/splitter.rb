def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  size_array = []
  other_array = []
  array.each do |word|
    if word.length == size
      size_array.push(word)
    else
      other_array.push(word)
    end
  end
  return [size_array.sort, other_array.sort]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.
  selected_array = []
  other_array = []
  array.each do |word|
    if yield(word)
      selected_array.push(word)
    else
      other_array.push(word)
    end
  end
  return [selected_array, other_array]
end
