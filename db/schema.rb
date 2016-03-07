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

ActiveRecord::Schema.define(version: 20160307104451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.string   "property_type"
    t.string   "room_type"
    t.string   "street_address"
    t.string   "city"
    t.string   "postcode"
    t.string   "state"
    t.string   "country"
    t.integer  "no_of_guests"
    t.integer  "no_of_bedrooms"
    t.integer  "no_of_bathrooms"
    t.integer  "no_of_beds"
    t.integer  "min_stay"
    t.integer  "rent_per_night"
    t.text     "house_rules"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.json     "images"
    t.boolean  "published",       default: false
    t.string   "title"
    t.string   "house_number"
    t.float    "lat"
    t.float    "lng"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "total_payment"
    t.integer  "processors_id_for_payment"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "payments", ["reservation_id"], name: "index_payments_on_reservation_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.integer  "no_of_guests"
    t.date     "check_in_date"
    t.date     "check_out_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "about_me"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
