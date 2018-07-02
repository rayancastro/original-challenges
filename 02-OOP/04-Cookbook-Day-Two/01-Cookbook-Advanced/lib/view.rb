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
    puts "Enter the index of the recipe"
    gets.chomp.to_i
  end

  def ask_keyword
    puts "What ingredient would you like a recipe for?"
    keyword = gets.chomp.to_s
    puts "Looking for '#{keyword}' on LetsCookFrench..."
    return keyword
  end

  def list_recipes_to_import(titles)
    puts ""
    titles.each.with_index do |title,index|
      puts "#{index+1} - #{title}"
    end
    puts ""
  end

  def display_description(recipe)
    puts "#{recipe.name} - Prep time: #{recipe.prep_time} mins - Difficulty: #{recipe.difficulty}"
    puts ""
    puts "#{recipe.description}"
  end

  def display_all(recipes)
    puts "---------- Cookbook  ----------"
    recipes.each.with_index(1) do |recipe, index|
      puts "#{index} #{recipe.name} - Prep time: #{recipe.prep_time} mins - Difficulty: #{recipe.difficulty}"
    end
    puts "-------------------------------"
  end
end
