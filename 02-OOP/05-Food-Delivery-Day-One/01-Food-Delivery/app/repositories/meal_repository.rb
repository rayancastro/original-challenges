require 'csv'
CSV_OPTIONS = {headers: true, header_converters: :symbol}

class MealRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @meals = []
    @id = 0
    if File.exist?(csv_filepath)
      CSV.foreach(csv_filepath, CSV_OPTIONS) do |row|
        row[:id] = row[:id].to_i
        row[:price] = row[:price].to_i
        @meals << Meal.new(row)
      end
      @id = @meals[-1].id
    end
  end

  def next_id
    @id += 1
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = next_id
    @meals.push(meal)
    update_csv
  end

  def find(id)
    @meals.each do |meal|
      return meal if meal.id == id
    end
  end

  def update_csv
    CSV.open(@csv_filepath, "wb", CSV_OPTIONS) do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
