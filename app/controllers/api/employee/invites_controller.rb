class Api::Employee::InvitesController < Api::BaseController
  before_action :authenticate_api_employee_authentication!

  def create
    current_employee = current_api_employee_authentication.employee
    auth = EmployeeAuthentication.new(invite_params)
    employee_invitation = EmployeeInvitation.new_invite(current_employee, auth)
    if auth.valid? && employee_invitation.valid?
      ActiveRecord::Base.transaction do
        auth.save!
        employee_invitation.save!
      end
      Emails::EmployeeMailer.invite_mail(employee_invitation).deliver_now
      render json: { message: "#{auth.email}を招待しました" }
    else
      render json: { errors: auth.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    invitation = EmployeeInvitation
                   .available
                   .find_by!(id: invite_token_params[:id], token: invite_token_params[:token])
    auth = invitation.employee_authentication
    ActiveRecord::Base.transaction do
      invitation.update!(accepted_at: Time.current)
      auth.update!(update_invite_params)
    end
    render json: { message: "登録が完了しました", email: auth.email }
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  private

  def invite_params
    params.require(:invite).permit(:email).merge(password: Devise.friendly_token)
  end

  def invite_token_params
    params.permit(:id, :token)
  end

  def update_invite_params
    params.require(:invite).permit(:password, :password_confirmation)
  end
end
