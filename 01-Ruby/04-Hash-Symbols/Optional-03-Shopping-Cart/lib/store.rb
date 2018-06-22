# This file contains methods related to your store and its supplies.
# You should complete it according to the instructions in the TODO comments


def store_items
  { yogurts: 2,
    meat: 7,
    vegetables: 5,
    potatoes: 2,
    rice: 1 }
end

def product_in_store?(product)
  # TODO: Check whether product is present in the store items
  store_items.key?(product.to_sym)
end

def price_of_product(product)
  # TODO: Return the price of the given product, if it's in store. nil otherwise
  return store_items[product.to_sym] if store_items.key?(product.to_sym)
  return nil
end

def store_items_to_s
  store_items_string = ""
  store_items.map do |key, value|
    store_items_string += "- #{key}: #{value}€\n"
  end
  return store_items_string
end
