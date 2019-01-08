def timer_for
  init = Time.now
  yield
  finish = Time.now
  return finish - init
end

def my_map(array)
  arr = []
  array.each do |e|
    arr.push(yield(e))
  end
  return arr
end

def tag(tag_name, attributes = nil)
  if !attributes.nil?
    att = " " + attributes[0] + '="' + attributes[1] + '"'
    return "<#{tag_name}" + att + ">" + yield + "</#{tag_name}>"
  else
    return "<#{tag_name}>" + yield + "</#{tag_name}>"
  end
end
