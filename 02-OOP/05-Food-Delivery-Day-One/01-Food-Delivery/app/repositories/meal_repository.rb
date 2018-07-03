require 'csv'
CSV_OPTIONS = {headers: true}

class MealRepository
  def initialize(csv_filepath)
    @meals = []
    if File.exist?(csv_filepath)
      CSV.foreach(csv_filepath, CSV_OPTIONS) do |row|
        @meals.push(Meal.new(id: row['id'], name: row['name'], price: row['price']))
      end
    end
  end

  def all
    @meals
  end

  def add(meal)
    @meals.push(meal)
  end
end
