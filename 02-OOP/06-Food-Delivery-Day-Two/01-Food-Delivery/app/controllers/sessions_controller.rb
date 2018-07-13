require_relative '../views/session_view.rb'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def list
    @view.display_employees(@repository.all)
  end

  def sign_in
    username = @view.ask_username
    password = @view.ask_password
    employee = @employee_repository.find_by_username(username)
    # @view.clear
    if employee && employee.password == password
      @view.welcome(employee.username)
      return employee
    else
      @view.try_again
      sign_in
    end
  end
end
