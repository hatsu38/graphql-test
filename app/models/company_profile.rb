# == Schema Information
#
# Table name: company_profiles
#
#  id                      :bigint           not null, primary key
#  company_id              :bigint           not null
#  name(会社名)            :string           not null
#  subdomain(サブドメイン) :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_company_profiles_on_company_id  (company_id)
#  index_company_profiles_on_subdomain   (subdomain) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class CompanyProfile < ApplicationRecord
  # Constants

  # Relations
  belongs_to :company

  # Validations
  validates :name, presence: true
  validates :subdomain,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z0-9]\z/ }

  # Callbacks

  # Delegates

  # Scopes

  # Class Methods

  # Methods
end
