# frozen_string_literal: true

# == Schema Information
#
# Table name: employee_authentications
#
#  id                                                           :bigint           not null, primary key
#  employee_id                                                  :bigint           not null
#  provider(認証方法)                                           :string           default("email"), not null
#  uid                                                          :string           default(""), not null
#  encrypted_password(暗号化されたパスワード)                   :string           default(""), not null
#  reset_password_token(パスワードリセットのためのToken)        :string
#  reset_password_sent_at(パスワードリセットをした時刻)         :datetime
#  allow_password_change(パスワード変更が可能か)                :boolean          default(FALSE), not null
#  remember_created_at(認証情報を保存した時刻)                  :datetime
#  confirmation_token(SignUp時に確認する際のToken)              :string
#  confirmed_at(SignUp時に確認された時刻)                       :datetime
#  confirmation_sent_at(SignUpに必要な確認メールが送られた時刻) :datetime
#  unconfirmed_email(まだ確認されていないEmail)                 :string
#  email(Email)                                                 :string           default(""), not null
#  tokens(Token)                                                :json
#  created_at                                                   :datetime         not null
#  updated_at                                                   :datetime         not null
#
# Indexes
#
#  index_employee_authentications_on_confirmation_token    (confirmation_token) UNIQUE
#  index_employee_authentications_on_email                 (email) UNIQUE
#  index_employee_authentications_on_employee_id           (employee_id)
#  index_employee_authentications_on_reset_password_token  (reset_password_token) UNIQUE
#  index_employee_authentications_on_uid_and_provider      (uid,provider) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
class EmployeeAuthentication < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
