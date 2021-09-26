# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_23_151957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_division_profiles", comment: "事業部プロフィール", force: :cascade do |t|
    t.bigint "business_division_id", null: false
    t.string "name", default: "", null: false, comment: "名前"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_division_id"], name: "index_business_division_profiles_on_business_division_id"
  end

  create_table "business_divisions", comment: "事業部", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_business_divisions_on_company_id"
  end

  create_table "business_section_employees", comment: "課に所属する従業員", force: :cascade do |t|
    t.bigint "business_section_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_section_id", "employee_id"], name: "business_section_employees_on_business_section_and_employee", unique: true
    t.index ["business_section_id"], name: "index_business_section_employees_on_business_section_id"
    t.index ["employee_id"], name: "index_business_section_employees_on_employee_id"
  end

  create_table "business_section_profiles", comment: "課のプロフィール", force: :cascade do |t|
    t.bigint "business_section_id", null: false
    t.string "name", default: "", null: false, comment: "名前"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_section_id"], name: "index_business_section_profiles_on_business_section_id"
  end

  create_table "business_sections", comment: "課", force: :cascade do |t|
    t.bigint "business_division_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_division_id"], name: "index_business_sections_on_business_division_id"
  end

  create_table "companies", comment: "会社", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_profiles", comment: "会社プロフィール", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false, comment: "会社名"
    t.string "subdomain", null: false, comment: "サブドメイン"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_profiles_on_company_id"
    t.index ["subdomain"], name: "index_company_profiles_on_subdomain", unique: true
  end

  create_table "employee_authentications", comment: "従業員認証", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_employee_authentications_on_email", unique: true
    t.index ["employee_id"], name: "index_employee_authentications_on_employee_id"
    t.index ["reset_password_token"], name: "index_employee_authentications_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_employee_authentications_on_uid_and_provider", unique: true
  end

  create_table "employee_invitations", comment: "従業員の招待", force: :cascade do |t|
    t.bigint "employee_authentication_id", null: false
    t.bigint "invite_by_employee_id", comment: "招待した従業員"
    t.string "token", default: "", null: false, comment: "トークン"
    t.datetime "token_expired_at", comment: "トークン有効期限"
    t.datetime "accepted_at", comment: "招待承認日時"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_authentication_id"], name: "index_employee_invitations_on_employee_authentication_id"
    t.index ["invite_by_employee_id"], name: "index_employee_invitations_on_invite_by_employee_id"
    t.index ["token"], name: "index_employee_invitations_on_token", unique: true
  end

  create_table "employee_profiles", comment: "従業員プロフィール", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "name", default: "", null: false, comment: "名前"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_profiles_on_employee_id"
  end

  create_table "employees", comment: "従業員", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "business_division_profiles", "business_divisions"
  add_foreign_key "business_divisions", "companies"
  add_foreign_key "business_section_employees", "business_sections"
  add_foreign_key "business_section_employees", "employees"
  add_foreign_key "business_section_profiles", "business_sections"
  add_foreign_key "business_sections", "business_divisions"
  add_foreign_key "company_profiles", "companies"
  add_foreign_key "employee_authentications", "employees"
  add_foreign_key "employee_invitations", "employee_authentications"
  add_foreign_key "employee_invitations", "employees", column: "invite_by_employee_id"
  add_foreign_key "employee_profiles", "employees"
end
