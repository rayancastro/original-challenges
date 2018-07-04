class Session
  def initialize(customer_router, manager_router, delivery_router)
    @customer_router = customer_router
    @manager_router = manager_router
    @delivery_router = delivery_router
    @logged_in = false
    @running = true
  end

  def run
    puts "Welcome to Express Larica!!"
    puts "Sua comida na hora certa."
    until @logged_in && @running
      display_log_options
      choice = gets.chomp.to_i
      print `clear`
      log_in(choice)
    end
  end

  def display_log_options
    puts "Please sign in:"
    puts "1 - Customer"
    puts "2 - Delivery guy"
    puts "3 - Manager"
  end

  def stop
    @running = false
  end

  def log_in(choice)
    case choice
    when 1 then puts "Not yet implemented"
    when 2 then puts "Not yet implemented"
    when 3 then puts "Not yet implemented"
    when 4 then stop
    else
      puts "Please press a valid option number"
    end
  end
end
