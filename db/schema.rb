# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160523073006) do

  create_table "locations", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name",            limit: 255
    t.string   "middle_name",           limit: 255
    t.string   "last_name",             limit: 255
    t.string   "medical_record_number", limit: 255
    t.date     "date_of_birth"
    t.integer  "gender",                limit: 4
    t.integer  "status",                limit: 4
    t.integer  "location_id",           limit: 4
    t.integer  "viewed_count",          limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.datetime "deleted_at"
  end

  add_index "patients", ["deleted_at"], name: "index_patients_on_deleted_at", using: :btree
  add_index "patients", ["location_id"], name: "index_patients_on_location_id", using: :btree

  add_foreign_key "patients", "locations"
end
