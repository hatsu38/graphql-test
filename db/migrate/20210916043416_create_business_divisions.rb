class CreateBusinessDivisions < ActiveRecord::Migration[6.1]
  def change
    create_table :business_divisions, comment: "事業部" do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name, null: false, comment: "部署名"

      t.timestamps
    end
  end
end
