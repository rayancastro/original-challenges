require_relative 'base_controller.rb'
require_relative '../repositories/customer_repository.rb'

class CustomersController < BaseController
  def initialize(repository)
    super(repository)
  end

  def create_object
    name = @view.ask_name
    address = @view.ask_address
    Customer.new(name: name, address: address)
  end
end
