class CreateBusinessDivisionProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :business_division_profiles, comment: "事業部プロフィール" do |t|
      t.references :business_division, null: false, foreign_key: true
      t.string :name, null: false, default: "", comment: "名前"

      t.timestamps
    end
  end
end
