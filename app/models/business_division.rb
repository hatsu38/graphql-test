# == Schema Information
#
# Table name: business_divisions
#
#  id         :bigint           not null, primary key
#  company_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_business_divisions_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class BusinessDivision < ApplicationRecord
  # Constants

  # Relations
  belongs_to :company
  has_one :business_division_profile, dependent: :restrict_with_error
  has_many :business_sections, dependent: :restrict_with_error
  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
