class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.read
    when 3 then @controller.create
    when 4 then @controller.destroy
    when 5 then @controller.import
    when 6 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all recipes"
    puts "2 - Read a recipe description"
    puts "3 - Create a new recipe"
    puts "4 - Destroy a recipe"
    puts "5 - Import recipes from web"
    puts "6 - Stop and exit the program"
  end
end
