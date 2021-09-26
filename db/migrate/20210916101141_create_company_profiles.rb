class CreateCompanyProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :company_profiles, comment: "会社プロフィール" do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name, null: false, comment: "会社名"
      t.string :subdomain, null: false, comment: "サブドメイン"

      t.timestamps
    end
    add_index :company_profiles, :subdomain, unique: true
  end
end
