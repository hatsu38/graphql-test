# == Schema Information
#
# Table name: business_division_profiles
#
#  id                     :bigint           not null, primary key
#  business_division_id   :bigint           not null
#  name(名前)             :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_business_division_profiles_on_business_division_id  (business_division_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_division_id => business_divisions.id)
#
FactoryBot.define do
  factory :business_division_profile do
    association :business_division
    name { Faker::Name.name }
  end
end
