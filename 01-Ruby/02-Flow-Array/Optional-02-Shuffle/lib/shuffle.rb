def shuffle(array)
  seed = Random.new
  arr_clone = array.clone
  index_array = (0..array.size - 1).to_a
  array.each_index do |i|
    random = seed.rand(0..index_array.size - 1)
    arr_clone[i] = array[index_array[random]]
    index_array.delete(index_array[random])
  end
  return arr_clone
end

