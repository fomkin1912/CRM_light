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

ActiveRecord::Schema.define(version: 20161011015847) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street",     limit: 64
    t.string   "city",       limit: 32
    t.string   "state",      limit: 32
    t.string   "zipcode",    limit: 16
    t.string   "country",    limit: 32
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "companies", force: :cascade do |t|
    t.string   "title",           default: "", null: false
    t.string   "full_title"
    t.integer  "company_type_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "companies", ["company_type_id"], name: "index_companies_on_company_type_id"

  create_table "company_types", force: :cascade do |t|
    t.string   "title",      default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "company_types", ["title"], name: "index_company_types_on_title", unique: true

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name",             default: "",       null: false
    t.string   "last_name",              default: "",       null: false
    t.string   "mid_name",               default: "",       null: false
    t.string   "email"
    t.string   "alt_email"
    t.string   "phone",       limit: 24
    t.string   "mobile",      limit: 24
    t.string   "skype",       limit: 32
    t.integer  "address_id"
    t.string   "access",      limit: 12, default: "Public"
    t.integer  "user_id"
    t.integer  "assigned_to"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "company_id"
  end

  add_index "contacts", ["address_id"], name: "index_contacts_on_address_id"
  add_index "contacts", ["assigned_to"], name: "index_contacts_on_assigned_to"
  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id"
  add_index "contacts", ["first_name", "mid_name", "last_name"], name: "index_contacts_on_first_name_and_mid_name_and_last_name", unique: true
  add_index "contacts", ["first_name"], name: "index_contacts_on_first_name"
  add_index "contacts", ["last_name"], name: "index_contacts_on_last_name"
  add_index "contacts", ["mid_name"], name: "index_contacts_on_mid_name"
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"

  create_table "departments", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "departments", ["title"], name: "index_departments_on_title", unique: true

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
    t.integer  "created_by"
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true

  create_table "positions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["title"], name: "index_positions_on_title", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name",                              default: "",    null: false
    t.string   "last_name",                         default: "",    null: false
    t.string   "mid_name",                          default: "",    null: false
    t.string   "email",                             default: "",    null: false
    t.string   "phone",                  limit: 32
    t.string   "mobile",                 limit: 32
    t.string   "skype",                  limit: 64
    t.boolean  "enabled",                           default: false
    t.boolean  "admin",                             default: false
    t.integer  "address_id"
    t.integer  "group_id"
    t.integer  "department_id"
    t.integer  "position_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"
  add_index "users", ["department_id"], name: "index_users_on_department_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["group_id"], name: "index_users_on_group_id"
  add_index "users", ["position_id"], name: "index_users_on_position_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
