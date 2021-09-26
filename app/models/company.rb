# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  # Constants

  # Relations
  has_one :company_profile, dependent: :restrict_with_error
  has_many :business_divisions, dependent: :restrict_with_error

  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
