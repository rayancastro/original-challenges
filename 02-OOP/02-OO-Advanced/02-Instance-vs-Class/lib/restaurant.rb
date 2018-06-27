class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :name, :city, :average_rating

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average_rating = 0.0
    @number_of_rates = 0
  end

  def rate(new_rate)
    @average_rating  *= @number_of_rates
    @number_of_rates += 1
    @average_rating = (@average_rating + new_rate) / @number_of_rates
  end

  def self.filter_by_city(restaurants, city)
    filtered = []
    restaurants.each do |restaurant|
      filtered.push(restaurant) if restaurant.city == city
    end
    return filtered
  end
  # TODO: implement .filter_by_city and #rate methods
end

jules_verne = Restaurant.new("paris", "Jules Verne")

p jules_verne.name
p jules_verne.city
