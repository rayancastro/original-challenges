DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

MEALS = {
  "Happy Meal" => ["Cheese Burger", "French Fries", "Coca Cola"],
  "Best Of Big Mac" => ["Big Mac", "French Fries", "Coca Cola"],
  "Best Of McChicken" => ["McChicken", "Salad", "Sprite"]
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  orders.reduce(0) do |sum, order|
    if MEALS.key?(order)
      sum + MEALS[order].reduce(0) { |memo, suborder| memo + DISHES_CALORIES[suborder] }
    else
      sum + DISHES_CALORIES[order]
    end
  end
end

p calories_counter(["Best Of Big Mac", "Salad", "Happy Meal", "Sprite"])
