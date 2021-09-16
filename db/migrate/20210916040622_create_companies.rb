class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies, comment: "会社", &:timestamps
  end
end
