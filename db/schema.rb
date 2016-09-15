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

ActiveRecord::Schema.define(version: 20160915213455) do

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id"
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name",                       default: "",    null: false
    t.string   "last_name",                  default: "",    null: false
    t.string   "mid_name",                                   null: false
    t.string   "email",                                      null: false
    t.string   "phone",           limit: 32
    t.string   "mobile",          limit: 32
    t.string   "skype",           limit: 64
    t.string   "password_digest"
    t.boolean  "enabled",                    default: false
    t.boolean  "admin",                      default: false
    t.integer  "address_id"
    t.integer  "group_id"
    t.integer  "department_id"
    t.integer  "postiton_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"
  add_index "users", ["department_id"], name: "index_users_on_department_id"
  add_index "users", ["group_id"], name: "index_users_on_group_id"
  add_index "users", ["postiton_id"], name: "index_users_on_postiton_id"

end
