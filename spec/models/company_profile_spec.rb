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
require "rails_helper"

RSpec.describe CompanyProfile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
