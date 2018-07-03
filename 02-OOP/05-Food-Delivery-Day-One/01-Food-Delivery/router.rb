# TODO: implement the router of your app.
class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome"

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


