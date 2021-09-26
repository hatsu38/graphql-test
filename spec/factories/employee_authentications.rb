# == Schema Information
#
# Table name: employee_authentications
#
#  id                     :bigint           not null, primary key
#  employee_id            :bigint           not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  email                  :string
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_employee_authentications_on_email                 (email) UNIQUE
#  index_employee_authentications_on_employee_id           (employee_id)
#  index_employee_authentications_on_reset_password_token  (reset_password_token) UNIQUE
#  index_employee_authentications_on_uid_and_provider      (uid,provider) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
FactoryBot.define do
  factory :employee_authentication do
    association :employee
    uid { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    email { uid }
  end
end
