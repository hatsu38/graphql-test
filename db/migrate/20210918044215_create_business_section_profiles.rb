class CreateBusinessSectionProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :business_section_profiles, comment: "課のプロフィール" do |t|
      t.references :business_section, null: false, foreign_key: true
      t.string :name, null: false, default: "", comment: "名前"

      t.timestamps
    end
  end
end
