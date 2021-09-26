# == Schema Information
#
# Table name: business_sections
#
#  id                   :bigint           not null, primary key
#  business_division_id :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_business_sections_on_business_division_id  (business_division_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_division_id => business_divisions.id)
#
class BusinessSection < ApplicationRecord
  # Constants

  # Relations
  belongs_to :business_division
  has_one :business_section_profile, dependent: :restrict_with_error

  has_many :business_section_employees, dependent: :restrict_with_error
  has_many :employees, through: :business_section_employees

  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
