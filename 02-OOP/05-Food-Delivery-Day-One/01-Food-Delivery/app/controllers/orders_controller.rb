require_relative '../repositories/order_repository.rb'

class OrdersController

  attr_accessor :meal_repository, :employee_repository, :customer_repository, :order_repository
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = View.new
  end

  # def create_object
  #   meal = @view.ask_name
  #   employee = @view.ask_price
  #   Meal.new(name: name, price: price)
  # end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.display_orders(undelivered_orders)
  end

  def add
    attributes = {}
    attributes[:meal] = @meal_repository.find(@view.ask_meal_id)
    attributes[:customer] = @customer_repository.find(@view.ask_customer_id)
    attributes[:employee] = @employee_repository.find(@view.ask_employee_id)
    order = Order.new(attributes)
    @order_repository.add(order)
  end

  def list_my_orders

  end

  def mark_as_delivered

  end
end
