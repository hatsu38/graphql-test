# == Schema Information
#
# Table name: employee_invitations
#
#  id                                    :bigint           not null, primary key
#  employee_authentication_id            :bigint           not null
#  invite_by_employee_id(招待した従業員) :bigint
#  token(トークン)                       :string           default(""), not null
#  token_expired_at(トークン有効期限)    :datetime
#  accepted_at(招待承認日時)             :datetime
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#
# Indexes
#
#  index_employee_invitations_on_employee_authentication_id  (employee_authentication_id)
#  index_employee_invitations_on_invite_by_employee_id       (invite_by_employee_id)
#  index_employee_invitations_on_token                       (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (employee_authentication_id => employee_authentications.id)
#  fk_rails_...  (invite_by_employee_id => employees.id)
#
class EmployeeInvitation < ApplicationRecord
  # Constants
  TOKEN_EXPIRED_DATE = 7.days

  # Relations
  belongs_to :employee_authentication
  belongs_to :invite_by_employee, optional: true, class_name: "Employee"

  # Validations

  # Callbacks

  # Delegates

  # Scopes
  scope :available, lambda {
    where(accepted_at: nil, token_expired_at: Time.current..)
  }

  # Class Methods
  def self.new_invite(send_employee, receive_employee_authentication)
    new(
      employee_authentication: receive_employee_authentication,
      invite_by_employee: send_employee,
      token: SecureRandom.urlsafe_base64(40),
      token_expired_at: Time.current + TOKEN_EXPIRED_DATE
    )
  end

  # Methods
end
