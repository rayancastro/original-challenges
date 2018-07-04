# TODO: implement the router of your app.
class Router
  def initialize(controllers = {})
    @meals_controller = controllers[:meals]
    @sessions_controller = controllers[:sessions]
    @customers_controller = controllers[:customers]
    @orders_controller = controllers[:orders]
    @running = true
    @logged_in = false
  end

  def run
    puts ""
    puts "Welcome to Express Larica!!!"
    puts "Your food at the right time."

    until @logged_in
      display_log_options
      choice = gets.chomp.to_i
      print `clear`
      log_in(choice)
    end

    # while @running
    #   display_tasks
    #   action = gets.chomp.to_i
    #   print `clear`
    #   router_action(action)
    # end
  end

  def display_log_options
    puts "Please sign in:"
    puts "1 - Customer"
    puts "2 - Employee"
    puts "3 - Close program"
  end

  def display_tasks
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Close program"
  end

  def session_sign_in
    employee = @sessions_controller.sign_in
    if employee.manager?
      puts "Manager!"
    elsif employee.delivery_guy?
      puts "Delivery Guy!"
    else
      puts "Employee role is: #{employee.role}"
    end
    @logged_in = true
  end

  def log_in(choice)
    case choice
    when 1 then puts "Not yet implemented"
    when 2 then session_sign_in
    when 3 then stop
    else
      puts "Please press a valid option number"
    end
  end

  def router_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then stop
    else
      puts "Please press a valid option number"
    end
  end

  def stop
    @running = false
  end
end


