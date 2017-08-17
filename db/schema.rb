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

ActiveRecord::Schema.define(version: 20170817033329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lense_id"
    t.date     "borrow_date"
    t.date     "return_date"
    t.text     "booking_comment"
    t.boolean  "approved_by_owner"
    t.integer  "rating_from_renter"
    t.integer  "rating_from_owner"
    t.text     "review_by_renter"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["lense_id"], name: "index_bookings_on_lense_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "lenses", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "lens_type"
    t.text     "brand"
    t.text     "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "price"
    t.text     "location"
    t.string   "photo"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_lenses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_owner",               default: true
    t.text     "location"
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "lenses"
  add_foreign_key "bookings", "users"
  add_foreign_key "lenses", "users"
end
