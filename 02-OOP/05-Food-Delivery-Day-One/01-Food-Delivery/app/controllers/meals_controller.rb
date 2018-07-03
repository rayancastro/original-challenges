class Controller

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  def list
    @view.display_all(@meal_repository.all)
  end

  def create
    name = @view.ask_name
    price = @view.ask_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.add_meal(meal)
  end

end
