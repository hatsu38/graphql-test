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
require "rails_helper"

RSpec.describe BusinessSectionEmployee, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
