# == Schema Information
#
# Table name: business_section_employees
#
#  id                  :bigint           not null, primary key
#  business_section_id :bigint           not null
#  employee_id         :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  business_section_employees_on_business_section_and_employee  (business_section_id,employee_id) UNIQUE
#  index_business_section_employees_on_business_section_id      (business_section_id)
#  index_business_section_employees_on_employee_id              (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_section_id => business_sections.id)
#  fk_rails_...  (employee_id => employees.id)
#
class BusinessSectionEmployee < ApplicationRecord
  # Constants

  # Relations
  belongs_to :business_section
  belongs_to :employee

  # Validations
  validates :business_section_id, uniqueness: { scope: :employee_id }

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
