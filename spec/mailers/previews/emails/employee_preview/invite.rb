class Emails::EmployeePreview
  module Invite
    extend ActiveSupport::Concern

    included do
      def invite_mail
        employee_invitation = EmployeeInvitation.find_by(id: params[:id]) || EmployeeInvitation.last
        Emails::EmployeeMailer.invite_mail(employee_invitation)
      end
    end
  end
end
