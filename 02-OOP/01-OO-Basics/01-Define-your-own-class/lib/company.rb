class Company
  def initialize(name, type, employees)
    @name = name
    @type = type
    @employees = employees
  end

  def size
    @employees.size
  end
end
