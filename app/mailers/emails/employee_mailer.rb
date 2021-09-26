class Emails::EmployeeMailer < ApplicationMailer
  layout "emails/employee_mailer/mailer"
  # TODO: アドレスが決まったら変更する
  default from: "sample@example.com"

  include Emails::EmployeeMailer::Invite
end
