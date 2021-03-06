# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_26_105422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "town"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blood_bank_insurances", force: :cascade do |t|
    t.bigint "blood_bank_id"
    t.bigint "insurance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blood_bank_id"], name: "index_blood_bank_insurances_on_blood_bank_id"
    t.index ["insurance_id"], name: "index_blood_bank_insurances_on_insurance_id"
  end

  create_table "blood_banks", force: :cascade do |t|
    t.string "name"
    t.bigint "area_id"
    t.string "googlemap_link"
    t.string "number1"
    t.string "number2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_blood_banks_on_area_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_favorites_on_comment_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "hospital_insurances", force: :cascade do |t|
    t.bigint "hospital_id"
    t.bigint "insurance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_hospital_insurances_on_hospital_id"
    t.index ["insurance_id"], name: "index_hospital_insurances_on_insurance_id"
  end

  create_table "hospital_specialities", force: :cascade do |t|
    t.bigint "hospital_id"
    t.bigint "speciality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_hospital_specialities_on_hospital_id"
    t.index ["speciality_id"], name: "index_hospital_specialities_on_speciality_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.bigint "area_id"
    t.boolean "public"
    t.string "googlemap_link"
    t.string "number1"
    t.string "number2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_hospitals_on_area_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name"
    t.bigint "area_id"
    t.boolean "all_nigth"
    t.string "googlemap_link"
    t.string "number1"
    t.string "number2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_pharmacies_on_area_id"
  end

  create_table "pharmacy_insurances", force: :cascade do |t|
    t.bigint "pharmacy_id"
    t.bigint "insurance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insurance_id"], name: "index_pharmacy_insurances_on_insurance_id"
    t.index ["pharmacy_id"], name: "index_pharmacy_insurances_on_pharmacy_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetables", force: :cascade do |t|
    t.bigint "hospital_speciality_id"
    t.string "day"
    t.integer "start_hour"
    t.integer "end_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_speciality_id"], name: "index_timetables_on_hospital_speciality_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "blood_bank_insurances", "blood_banks"
  add_foreign_key "blood_bank_insurances", "insurances"
  add_foreign_key "blood_banks", "areas"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "comments"
  add_foreign_key "favorites", "users"
  add_foreign_key "hospital_insurances", "hospitals"
  add_foreign_key "hospital_insurances", "insurances"
  add_foreign_key "hospital_specialities", "hospitals"
  add_foreign_key "hospital_specialities", "specialities"
  add_foreign_key "hospitals", "areas"
  add_foreign_key "pharmacies", "areas"
  add_foreign_key "pharmacy_insurances", "insurances"
  add_foreign_key "pharmacy_insurances", "pharmacies"
  add_foreign_key "timetables", "hospital_specialities"
end
