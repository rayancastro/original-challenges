# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative './app/controllers/meals_controller.rb'
require_relative './app/models/meal.rb'
require_relative './app/repositories/meal_repository'
require_relative './app/views/view.rb'
require_relative './router.rb'
require 'csv'

csv_file = File.join(__dir__, 'meals.csv')
meal_repository = MealRepository.new(csv_file)
meals_controller = MealsController.new(meal_repository)
router = Router.new(meals_controller)

router.run
