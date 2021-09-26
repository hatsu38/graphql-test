# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :employee do
    trait :with_employee_authentication do
      after(:build) do |employee|
        employee.employee_authentication = build(:employee_authentication)
      end
    end

    trait :with_employee_profile do
      after(:build) do |employee|
        employee.employee_profile = build(:employee_profile)
      end
    end
  end
end
