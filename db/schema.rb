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

ActiveRecord::Schema.define(version: 20150511132722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claimed_dishes", force: :cascade do |t|
    t.string   "yummly_id",  null: false
    t.string   "photo_url"
    t.string   "name"
    t.integer  "rsvp_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nono_users", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "nono_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nonos", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "category",    null: false
    t.string   "yummly_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "date"
    t.string   "location"
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "party_id",                       null: false
    t.integer  "user_id",                        null: false
    t.string   "status",     default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unregistered_emails", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "party_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "name",            null: false
    t.string   "photo_url"
    t.string   "fave"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
