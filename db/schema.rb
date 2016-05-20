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

ActiveRecord::Schema.define(version: 20160520180516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.string   "year",           default: "2016"
    t.string   "code"
    t.string   "callback_phone"
    t.text     "notes"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "available",      default: true
  end

  create_table "leads", force: :cascade do |t|
    t.string   "account"
    t.string   "name1"
    t.string   "name2"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "phone3"
    t.string   "source_code"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "campaign_id"
    t.datetime "last_dialed",  default: '2016-04-28 19:30:07', null: false
    t.integer  "dial_count",   default: 0
    t.boolean  "killed",       default: false
    t.boolean  "day_lead",     default: false
    t.boolean  "disconnected", default: false
  end

  add_index "leads", ["account"], name: "index_leads_on_account", using: :btree
  add_index "leads", ["campaign_id"], name: "index_leads_on_campaign_id", using: :btree

  create_table "nos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lead_id"
    t.datetime "date",       default: '2016-05-20 18:08:26'
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "nos", ["lead_id"], name: "index_nos_on_lead_id", using: :btree
  add_index "nos", ["user_id"], name: "index_nos_on_user_id", using: :btree

  create_table "recalls", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lead_id"
    t.datetime "time"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recalls", ["lead_id"], name: "index_recalls_on_lead_id", using: :btree
  add_index "recalls", ["user_id"], name: "index_recalls_on_user_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lead_id"
    t.datetime "date"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sales", ["lead_id"], name: "index_sales_on_lead_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "nickname"
    t.integer  "role"
    t.string   "fullname"
    t.string   "phone"
    t.boolean  "approved",               default: false, null: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "nos", "leads"
  add_foreign_key "nos", "users"
  add_foreign_key "recalls", "leads"
  add_foreign_key "recalls", "users"
  add_foreign_key "sales", "leads"
  add_foreign_key "sales", "users"
end
