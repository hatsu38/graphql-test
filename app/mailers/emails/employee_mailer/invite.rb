class Emails::EmployeeMailer
  module Invite
    extend ActiveSupport::Concern

    included do
      def invite_mail(employee_invitation)
        @employee_invitation = employee_invitation
        @employee_authentication = @employee_invitation.employee_authentication
        @signup_host = Rails.env.production? ? "https://graphql-test.com" : "http://localhost:8080"
        subject = "【GraphqlTest】会員登録をお願いします"
        subject = "！開発環境！#{subject}" unless Rails.env.production?

        mail(to: @employee_authentication.email, subject: subject)
      end
    end
  end
end
