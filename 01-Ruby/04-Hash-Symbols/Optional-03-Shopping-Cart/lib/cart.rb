# This file contains methods related to your shopping cart.
# You should complete it according to the instructions in the TODO comments

def add_to_cart(cart, product)
  # TODO: you get a cart and a product. Add the product to the cart!
  cart << product
end

def cart_to_s(cart)
  # TODO: you get a cart, return a coma-separated String list of the contained products
  cart.join(',')
end

def cart_total_price(cart, store_items)
  # TODO: you get a cart and the store items with their prices. Return the total
  # price of the shopping cart.
  # /!\ Make sure it does not crash with carts having items not in store!
  sum = 0
  # For each word, check for hash corresponding value. adds to sum
  cart.each do |item|
    sum += store_items[item.to_sym] if store_items.key?(item.to_sym)
  end
  return sum
end
