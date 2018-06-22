# This file contains methods related to your store and its supplies.
# You should complete it according to the instructions in the TODO comments


def store_items
  # Here's what you should have in store:
    # yogurts: 2€
    # meat: 7€
    # vegetables: 5€
    # potatoes: 2€
    # rice: 1€

  # TODO: find the correct data structure to hold the shopping store items
  # instead of using nil below
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
  # TODO: Return a String with all store items in the following form:
  # - Meat: 7€
  # - Vegetables: 5€
  # ...
  #
  # HINT: add line breaks in your String with "\n"
  store_items.map { |key, value|  }
end
