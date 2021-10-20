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

ActiveRecord::Schema.define(version: 2021_10_20_041640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "town"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "hospital_specialities", "hospitals"
  add_foreign_key "hospital_specialities", "specialities"
  add_foreign_key "hospitals", "areas"
end
