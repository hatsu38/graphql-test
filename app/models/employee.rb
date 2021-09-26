# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Employee < ApplicationRecord
  # Constants

  # Relations
  has_one :employee_profile, dependent: :restrict_with_error
  has_one :employee_authentication, dependent: :restrict_with_error
  has_many :business_section_employees, dependent: :restrict_with_error
  has_many :business_sections, through: :business_section_employees
  has_many :employee_invitations, dependent: :nullify
  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
