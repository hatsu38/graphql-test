class CreateBusinessSections < ActiveRecord::Migration[6.1]
  def change
    create_table :business_sections, comment: "課" do |t|
      t.references :business_division, null: false, foreign_key: true

      t.timestamps
    end
  end
end
