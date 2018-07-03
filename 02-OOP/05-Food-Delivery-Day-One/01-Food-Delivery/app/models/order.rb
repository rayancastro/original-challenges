class Order
  attr_accessor :id, :meal, :employee, :customer, :delivered

  def initialize(attributes = {})
    @meal = attributes[:meal] || ""
    @employee = attributes[:employee] || ""
    @customer = attributes[:customer]
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    delivered
  end

  def deliver!
    @delivered = true
  end
end
