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

ActiveRecord::Schema.define(version: 20191007070235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "apis", force: :cascade do |t|
    t.string "url"
    t.integer "offset"
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computers", force: :cascade do |t|
    t.string "connector_guid"
    t.string "hostname"
    t.string "active"
    t.hstore "links", default: {}
    t.string "connector_version"
    t.string "operating_system"
    t.string "external_ip"
    t.hstore "policy", default: {}
    t.hstore "isolation", default: {}
    t.string "group_guid"
    t.string "install_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faults", force: :cascade do |t|
    t.bigint "computer_id"
    t.string "falut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computer_id"], name: "index_faults_on_computer_id"
  end

  create_table "internal_ips", force: :cascade do |t|
    t.bigint "computer_id"
    t.string "ips"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computer_id"], name: "index_internal_ips_on_computer_id"
  end

  create_table "isolations", force: :cascade do |t|
    t.bigint "computer_id"
    t.hstore "isolation", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computer_id"], name: "index_isolations_on_computer_id"
  end

  create_table "network_addresses", force: :cascade do |t|
    t.bigint "computer_id"
    t.hstore "network_address", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computer_id"], name: "index_network_addresses_on_computer_id"
  end

  create_table "site_settings", force: :cascade do |t|
    t.string "api_client_id"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "user_type", default: 1
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
