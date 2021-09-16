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

ActiveRecord::Schema.define(version: 2021_09_16_045501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_divisions", comment: "事業部", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false, comment: "部署名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_business_divisions_on_company_id"
  end

  create_table "companies", comment: "会社", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_profiles", comment: "会社プロフィール", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false, comment: "会社名"
    t.string "subdomain", null: false, comment: "会社のサブドメイン"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_profiles_on_company_id"
    t.index ["subdomain"], name: "index_company_profiles_on_subdomain", unique: true
  end

  create_table "employee_profiles", comment: "従業員プロフィール", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "name", null: false, comment: "名前"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_profiles_on_employee_id"
  end

  create_table "employees", comment: "従業員", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "business_divisions", "companies"
  add_foreign_key "company_profiles", "companies"
  add_foreign_key "employee_profiles", "employees"
end
