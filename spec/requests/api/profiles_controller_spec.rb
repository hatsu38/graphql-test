require "rails_helper"

RSpec.describe Api::ProfilesController, type: :request do
  describe "#show" do
    context "ログインしていない場合" do
      let(:employee) { create(:employee, :with_employee_authentication, :with_employee_profile) }

      it "401" do
        get api_profile_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "ログインしている場合" do
      let(:business_section_profile) { create(:business_section_profile) }
      let(:employee) do
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

      it "200" do
        get api_profile_path, headers: header
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
