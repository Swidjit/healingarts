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

ActiveRecord::Schema.define(version: 20160711011812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shifts", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "station_id"
    t.integer  "table_count",  default: 0
    t.integer  "roamer_count", default: 0
    t.integer  "table_max"
    t.integer  "roamer_max"
  end

  create_table "shifts_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "shift_id"
  end

  add_index "shifts_users", ["shift_id"], name: "index_shifts_users_on_shift_id", using: :btree
  add_index "shifts_users", ["user_id"], name: "index_shifts_users_on_user_id", using: :btree

  create_table "stations", force: :cascade do |t|
    t.string  "name"
    t.integer "tables"
    t.integer "roamers"
    t.text    "hours",   array: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "business"
    t.string   "skill"
    t.boolean  "needs_table"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
