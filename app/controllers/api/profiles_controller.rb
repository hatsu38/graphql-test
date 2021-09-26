class Api::ProfilesController < Api::BaseController
  before_action :authenticate_api_employee_authentication!

  def show
    employee = current_api_employee_authentication.employee
    @employee_profile = employee.employee_profile
    @business_sections = employee.business_sections
  end
end
