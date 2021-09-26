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
FactoryBot.define do
  factory :company_profile do
    association :company
    name { Faker::Name.name }
    subdomain { Faker::Internet.domain_word }
  end
end
