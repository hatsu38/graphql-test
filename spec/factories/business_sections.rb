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
FactoryBot.define do
  factory :business_section do
    association :business_division
  end
end
