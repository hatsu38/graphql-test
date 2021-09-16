class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees, comment: "従業員", &:timestamps
  end
end
