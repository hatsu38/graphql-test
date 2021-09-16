class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees, comment: "従業員" do |t|
      t.references :business_division, null: false, foreign_key: true

      t.timestamps
    end
  end
end
