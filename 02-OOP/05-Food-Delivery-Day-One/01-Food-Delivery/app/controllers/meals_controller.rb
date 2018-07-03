require_relative '../views/view.rb'
require_relative '../repositories/meal_repository.rb'

class MealsController

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  def list
    @view.display_all(@meal_repository.all)
  end

  def add
    name = @view.ask_name
    price = @view.ask_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.add(meal)
  end

end
