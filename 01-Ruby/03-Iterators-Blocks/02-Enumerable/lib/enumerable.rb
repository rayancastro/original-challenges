def sum_odd_indexed(array)
  sum = 0
  array.each_with_index do |e, i|
    sum += e unless (i % 2).zero?
  end
  return sum
end

def even_numbers(array)
  return array.select { |num| num.even? }
end

def short_words(array, max_length)
  return array.reject { |words| words.length > max_length }
end

def first_under(array, limit)
  array.find { |num| num < limit }
end

def add_bang(array)
  return array.map { |string| string + "!" }
end

def concatenate(array)
  return array.reduce(:+)
end

def sorted_pairs(array)
  sliced_array = []
  array.each_slice(2) { |e| sliced_array.push(e.sort) }
  return sliced_array
end
