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

ActiveRecord::Schema.define(version: 20150423105436) do

  create_table "insurance_firms", force: :cascade do |t|
    t.string   "company_name",         limit: 255
    t.integer  "TIN_NUMBER",           limit: 4
    t.integer  "VAT_NUMBER",           limit: 4
    t.string   "physical_address",     limit: 255
    t.string   "postal_address",       limit: 255
    t.string   "contact_person",       limit: 255
    t.integer  "primary_phone_number", limit: 4
    t.integer  "other_phone_number",   limit: 4
    t.integer  "fax",                  limit: 4
    t.string   "email",                limit: 255
    t.string   "specialization",       limit: 255
    t.string   "legrep_first_name",    limit: 255
    t.string   "legrep_last_name",     limit: 255
    t.string   "address",              limit: 255
    t.integer  "pri_phone_num",        limit: 4
    t.integer  "other_phone_num",      limit: 4
    t.string   "rep_email",            limit: 255
    t.string   "remarks",              limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "insurance_premiums", force: :cascade do |t|
    t.string  "insurance_firm",     limit: 255
    t.integer "premium_amount",     limit: 4
    t.float   "premium_percentage", limit: 24
    t.string  "remarks",            limit: 255
  end

  create_table "law_firms", force: :cascade do |t|
    t.string   "company_name",         limit: 255
    t.integer  "TIN_NUMBER",           limit: 4
    t.integer  "VAT_NUMBER",           limit: 4
    t.string   "physical_address",     limit: 255
    t.string   "postal_address",       limit: 255
    t.string   "contact_person",       limit: 255
    t.integer  "primary_phone_number", limit: 4
    t.integer  "other_phone_number",   limit: 4
    t.integer  "fax",                  limit: 4
    t.string   "email",                limit: 255
    t.string   "specialization",       limit: 255
    t.string   "legrep_first_name",    limit: 255
    t.string   "legrep_last_name",     limit: 255
    t.string   "address",              limit: 255
    t.integer  "pri_phone_num",        limit: 4
    t.integer  "other_phone_num",      limit: 4
    t.string   "rep_email",            limit: 255
    t.string   "remarks",              limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "legal_fees", force: :cascade do |t|
    t.string  "law_firm",        limit: 255
    t.integer "fees_amount",     limit: 4
    t.float   "fees_percentage", limit: 24
    t.string  "remarks",         limit: 255
  end

  create_table "property_descriptions", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "property_identifications", force: :cascade do |t|
    t.string   "customer_code",           limit: 255
    t.integer  "customer",                limit: 4
    t.integer  "tenure_system",           limit: 4
    t.string   "LRV",                     limit: 255
    t.string   "folio",                   limit: 255
    t.date     "lease_effective_date"
    t.date     "lease_expiry_date"
    t.integer  "lease_tenor",             limit: 4
    t.integer  "outstanding_lease_tenor", limit: 4
    t.integer  "unit",                    limit: 4
    t.integer  "flat",                    limit: 4
    t.integer  "block",                   limit: 4
    t.integer  "plot",                    limit: 4
    t.string   "road_location",           limit: 255
    t.integer  "area",                    limit: 4
    t.integer  "district",                limit: 4
    t.string   "county",                  limit: 255
    t.string   "sub_county",              limit: 255
    t.string   "parish",                  limit: 255
    t.string   "LC",                      limit: 255
    t.decimal  "land_area_hectares",                  precision: 10
    t.decimal  "land_area_acres",                     precision: 10
    t.decimal  "built_area",                          precision: 10
    t.string   "property_description",    limit: 255
    t.integer  "number_of_units",         limit: 4
    t.string   "property_type",           limit: 255
    t.integer  "number_of_bedrooms",      limit: 4
    t.integer  "property_status",         limit: 4
    t.string   "roof_type",               limit: 255
    t.string   "additional_description",  limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "property_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "user_settings", force: :cascade do |t|
    t.time     "password_expiration"
    t.integer  "password_length",           limit: 4
    t.integer  "password_history_count",    limit: 4
    t.integer  "entries_till_lock",         limit: 4
    t.time     "successive_password_entry"
    t.time     "inactive_terminal_closure"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "encrypted_password",     limit: 255
    t.string   "salt",                   limit: 255
    t.string   "role",                   limit: 255
    t.string   "email",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token",             limit: 255
    t.string   "password_reset_token",   limit: 255
    t.datetime "password_reset_sent_at"
  end

  create_table "valuation_fees", force: :cascade do |t|
    t.string  "valuer",          limit: 255
    t.integer "fees_amount",     limit: 4
    t.float   "fees_percentage", limit: 24
    t.string  "remarks",         limit: 255
  end

  create_table "valuers", force: :cascade do |t|
    t.string   "company_name",         limit: 255
    t.integer  "TIN_NUMBER",           limit: 4
    t.integer  "VAT_NUMBER",           limit: 4
    t.string   "physical_address",     limit: 255
    t.string   "postal_address",       limit: 255
    t.string   "contact_person",       limit: 255
    t.integer  "primary_phone_number", limit: 4
    t.integer  "other_phone_number",   limit: 4
    t.integer  "fax",                  limit: 4
    t.string   "email",                limit: 255
    t.string   "specialization",       limit: 255
    t.string   "legrep_first_name",    limit: 255
    t.string   "legrep_last_name",     limit: 255
    t.string   "address",              limit: 255
    t.integer  "pri_phone_num",        limit: 4
    t.integer  "other_phone_num",      limit: 4
    t.string   "rep_email",            limit: 255
    t.string   "remarks",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
