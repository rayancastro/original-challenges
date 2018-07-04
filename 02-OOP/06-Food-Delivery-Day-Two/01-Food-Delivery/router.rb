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
    puts "Welcome to Express Larica!!"
    puts "Sua comida na hora certa."

    until @logged_in
      display_log_options
      choice = gets.chomp.to_i
      print `clear`
      log_in(choice)
    end

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      router_action(action)
    end
  end

  def display_tasks
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Close program"
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


