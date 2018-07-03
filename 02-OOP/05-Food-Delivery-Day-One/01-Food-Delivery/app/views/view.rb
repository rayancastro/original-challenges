class View

  def ask_name
    puts "What's the name?"
    gets.chomp.to_s
  end

  def ask_address
    puts "What's the address?"
    gets.chomp.to_s
  end

  def ask_price
    puts "What's the price?"
    gets.chomp.to_i
  end

  def ask_meal_id
    puts "What's the meal_id?"
    gets.chomp.to_i
  end

  def ask_customer_id
    puts "What's the customer_id?"
    gets.chomp.to_i
  end

  def ask_order_id
    puts "What's the order_id?"
    gets.chomp.to_i
  end

  def ask_employee_id
    puts "What's the employee_id?"
    gets.chomp.to_i
  end

  def display_orders(orders)
    orders.each do |order|
      puts "Customer: #{order.customer.name}, #{order.customer.address} - Meal: #{order.meal.name}, Employee: #{order.employee.username}"
    end
  end

  def display_all(meals)
    # puts "**** LIST OF MEALS ****"
    meals.each do |meal|
      puts "#{meal.name}"
    end
    # puts "***** END OF LIST *****"
  end
end
