# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_082900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state_province"
    t.string "postal_code"
    t.string "country_other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.bigint "profile_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["profile_id"], name: "index_addresses_on_profile_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "display_name"
    t.text "description"
    t.text "internal_notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.string "region"
    t.string "sub_region"
    t.string "status"
    t.string "country_other"
    t.string "state_province"
    t.string "club_number", null: false
    t.index ["club_number"], name: "index_clubs_on_club_number", unique: true
    t.index ["country_id"], name: "index_clubs_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "display_name", default: "", null: false
    t.string "country_code", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "display_name"
    t.string "locale_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "phone"
    t.string "country_other"
    t.string "club_other"
    t.text "bio"
    t.integer "year_joined"
    t.string "member_id"
    t.boolean "also_english"
    t.string "facebook"
    t.string "twitter"
    t.string "whatsapp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.bigint "user_id"
    t.bigint "club_id"
    t.bigint "language_id"
    t.index ["club_id"], name: "index_profiles_on_club_id"
    t.index ["country_id"], name: "index_profiles_on_country_id"
    t.index ["language_id"], name: "index_profiles_on_language_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "system_name"
    t.string "display_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "addresses", "countries"
  add_foreign_key "clubs", "countries"
  add_foreign_key "profiles", "clubs"
  add_foreign_key "profiles", "countries"
  add_foreign_key "profiles", "languages"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "roles"
end
