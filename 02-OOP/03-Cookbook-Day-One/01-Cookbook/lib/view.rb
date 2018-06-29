class View
  def input_name
    puts "Enter the name of the recipe"
    gets.chomp
  end

  def input_description
    puts "Enter the description of the recipe"
    gets.chomp
  end

  def input_index
    puts "Enter the description of the recipe you want to delete"
    gets.chomp.to_i
  end

  def display_all(recipes)
    puts "---------- Cookbook  ----------"
    @recipes.each do |recipe|
      puts "#{recipe[:index]} #{recipe[:name]} - #{recipe[:description]}"
    end
    puts "-------------------------------"
  end
end
