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
require "rails_helper"

RSpec.describe EmployeeInvitation, type: :model do
  describe "#available" do
    let(:expired_invitation) do
      create_list(:employee_invitation, 2,
                  token_expired_at: Time.current - EmployeeInvitation::TOKEN_EXPIRED_DATE - 1.day)
    end
    let(:accepted_invitation) { create_list(:employee_invitation, 2, accepted_at: Time.current - 1.day) }
    let(:available_invitation) { create_list(:employee_invitation, 2) }

    it "availableのみであること" do
      expect(described_class.available).to match_array(available_invitation)
    end
  end
end
