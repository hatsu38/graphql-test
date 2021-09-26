class CreateEmployeeInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_invitations, comment: "従業員の招待" do |t|
      t.references :employee_authentication, null: false, foreign_key: true
      t.references :invite_by_employee, foreign_key: { to_table: :employees }, comment: "招待した従業員"
      t.string :token, null: false, default: "", comment: "トークン"
      t.datetime :token_expired_at, comment: "トークン有効期限"
      t.datetime :accepted_at, comment: "招待承認日時"

      t.timestamps
    end
    add_index :employee_invitations, :token, unique: true
  end
end
