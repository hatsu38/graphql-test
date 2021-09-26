class CreateEmployeeProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_profiles, comment: "従業員プロフィール" do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :name, null: false, default: "", comment: "名前"

      t.timestamps
    end
  end
end
