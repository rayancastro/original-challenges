class Company
  attr_reader :company_name
  attr_reader :type
  attr_reader :employees

  def initialize(company_name, type, employees)
    @company_name = company_name
    @type = type
    @employees = employees
  end

  def add_employee(employee_name)
    @employees.push(employee_name)
  end

  def size
    return @employees.size
  end
end
