# == Schema Information
#
# Table name: employees
#
#  id                   :bigint           not null, primary key
#  business_division_id :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_employees_on_business_division_id  (business_division_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_division_id => business_divisions.id)
#
class Employee < ApplicationRecord
  # Constants

  # Relations

  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
