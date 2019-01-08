require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.4.0/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.4.0/String.html#method-i-chomp
check = "s"
students = []
puts "Type a student name:"
loop do
  check = gets.chomp.to_s
  break if check == ""
  students.push(check)
  puts "Type another student name or press enter to finish:"
end


# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
sorted_students = wagon_sort(students)
p "#{sorted_students.size} students"
str = ""
sorted_students[0, sorted_students.size - 1].each { |word| str += word + ", " }
str.strip!
str.chop!
str += " and " + sorted_students[sorted_students.size - 1]
p str
