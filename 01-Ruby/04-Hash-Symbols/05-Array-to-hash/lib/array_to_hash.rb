def array_to_hash(array)
  hash_array = {}
  array.each_with_index do |value, index|
    if block_given?
      hash_array[yield(index).to_s] = value
    else
      hash_array[index.to_s] = value
    end
  end
  return hash_array
end


