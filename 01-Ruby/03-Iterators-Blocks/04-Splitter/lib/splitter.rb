def size_splitter(array, size)
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
