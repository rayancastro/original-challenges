class View

  def ask_name
    puts "What's the name of the meal?"
    gets.chomp.to_s
  end

  def ask_price
    puts "What's the price of the meal?"
    gets.chomp.to_i
  end

  def display_all(meals)
    puts "**** LIST OF MEALS ****"
    meals.each.with_index do |meal, index|
      puts "#{index+1} - #{meal}"
    end
    puts "***** END OF LIST *****"
  end
end
