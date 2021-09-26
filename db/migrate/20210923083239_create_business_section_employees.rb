class CreateBusinessSectionEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :business_section_employees, comment: "課に所属する従業員" do |t|
      t.references :business_section, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
    add_index :business_section_employees,
              [:business_section_id, :employee_id],
              unique: true,
              name: "business_section_employees_on_business_section_and_employee"
  end
end
