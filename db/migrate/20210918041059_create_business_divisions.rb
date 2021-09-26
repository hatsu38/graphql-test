class CreateBusinessDivisions < ActiveRecord::Migration[6.1]
  def change
    create_table :business_divisions, comment: "事業部" do |t|
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
