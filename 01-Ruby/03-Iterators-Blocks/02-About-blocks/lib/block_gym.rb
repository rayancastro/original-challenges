def timer_for
  init = Time.now
  yield
  finish = Time.now
  return finish - init
end

def my_map(array)
  # TODO: Re-implement the same behavior as `Enumerable#map` without using it! You can use `#each` though.
  arr = []
  array.each do |e|
    arr.push(yield(e))
  end
  return arr
end

def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  if !attributes.nil?
    att = " " + attributes[0] + '="' + attributes[1] + '"'
    return "<#{tag_name}" + att + ">" + yield + "</#{tag_name}>"
  else
    return "<#{tag_name}>" + yield + "</#{tag_name}>"
  end
end
