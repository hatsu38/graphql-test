# == Schema Information
#
# Table name: employee_profiles
#
#  id            :bigint           not null, primary key
#  employee_id   :bigint           not null
#  name(名前)    :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_employee_profiles_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
class EmployeeProfile < ApplicationRecord
  # Constants

  # Relations

  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
