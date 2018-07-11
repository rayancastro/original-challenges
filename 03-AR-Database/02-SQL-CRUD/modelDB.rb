ew

class Meal
  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @id = attributes[:id]
    DB.results_as_hash = true
  end

  def self.all
    result = []
    query = "SELECT id, name, price FROM meals"
    all meals = DB.execute(query).each do |meal|
      result << Meal.new(id: meal['id'],name: meal['name'],price: meal['price'])
    end
  end

  def self.find(id)
    query = "SELECT id, name, price FROM meals WHERE id = ?"
    meal = DB.execute(query, id).first
    Meal.new(id: meal['id'],name: meal['name'],price: meal['price'])
  end

  def save
    @id.nil? ? insert : update
  end

  def insert
    query = "SELECT"
    DB.execute
  end

  def update
    query = "UPDATE"
    DB.execute
  end

  def destroy
    query = "DELETE FROM meals "
    DB.execute
  end
end

# def save
#     @id.nil? ? insert : update
#   end

  # def destroy
#     DB.execute('DELETE FROM meals WHERE id=?', @id)
#   end

#   private

#   def insert
#     DB.execute('INSERT INTO meals (name, price) VALUES (?, ?)', @name, @price)
#     @id = DB.last_insert_row_id
#   end

#   def update
#     DB.execute('UPDATE meals SET name=?, price=? WHERE id=?', @name, @price, @id)
#   end
