require "rails_helper"

RSpec.describe Api::Employee::InvitesController, type: :request do
  describe "#create" do
    context "ログインしていない場合" do
      let(:employee) { create(:employee, :with_employee_authentication, :with_employee_profile) }

      it "401" do
        post api_employee_invites_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "ログインしている場合" do
      let(:business_section_profile) { create(:business_section_profile) }
      let!(:employee) do
        create(
          :employee,
          :with_employee_authentication,
          :with_employee_profile
        )
      end
      let(:business_section_employee) do
        create(
          business_section: business_section_profile.business_section,
          employee: employee
        )
      end

      let(:header) { with_auth_header(employee.employee_authentication) }

      context "正常" do
        let(:params) { { invite: { email: Faker::Internet.email } } }

        it "200" do
          expect do
            post api_employee_invites_path, headers: header, params: params
          end.to change(EmployeeAuthentication, :count).by(1)
                   .and change(EmployeeInvitation, :count).by(1)
          expect(response).to have_http_status(:ok)
          expect(json["message"]).to include(params[:invite][:email])
        end
      end

      context "例外" do
        let(:params) { { invite: { email: "hoge" } } }

        it "422" do
          expect do
            post api_employee_invites_path, headers: header, params: params
          end.to change(EmployeeAuthentication, :count).by(0)
                   .and change(EmployeeInvitation, :count).by(0)

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "#update" do
    context "ログインしていない場合" do
      let(:employee) { create(:employee, :with_employee_authentication, :with_employee_profile) }
      let(:employee_invitation) { create(:employee_invitation) }

      it "401" do
        put api_employee_invite_path(id: employee_invitation.id, token: employee_invitation.token)
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "ログインしている場合" do
      let(:employee) { create(:employee, :with_employee_authentication, :with_employee_profile) }
      let!(:employee_invitation) { create(:employee_invitation) }
      let(:header) { with_auth_header(employee.employee_authentication) }
      let(:params) { { invite: { password: "hogehoge", password_confirmation: "hogehoge" } } }

      context "正常" do
        before { freeze_time }

        it "200" do
          put api_employee_invite_path(id: employee_invitation.id, token: employee_invitation.token),
              headers: header,
              params: params
          expect(response).to have_http_status(:ok)
          expect(json["email"]).to eq(employee_invitation.employee_authentication.email)

          employee_invitation.reload
          expect(employee_invitation.accepted_at).to eq(Time.current)
        end
      end

      context "例外" do
        before { travel_to(Time.current + EmployeeInvitation::TOKEN_EXPIRED_DATE + 1.minute) }

        it "トークンの期限切れ" do
          put api_employee_invite_path(id: employee_invitation.id + 1, token: employee_invitation.token),
              headers: header,
              params: params
          expect(response).to have_http_status(:not_found)

          employee_invitation.reload
          expect(employee_invitation.accepted_at).to eq(nil)
        end
      end
    end
  end
end
