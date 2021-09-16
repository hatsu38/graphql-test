# == Schema Information
#
# Table name: business_divisions
#
#  id           :bigint           not null, primary key
#  company_id   :bigint           not null
#  name(部署名) :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
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

  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
