# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_17_060417) do

  create_table "absences", charset: "utf8", force: :cascade do |t|
    t.date "date_when", null: false
    t.integer "reason_id", null: false
    t.time "time_when", null: false
    t.string "status", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_absences_on_user_id"
  end

  create_table "contacts", charset: "utf8", force: :cascade do |t|
    t.string "subject", null: false
    t.string "contents", null: false
    t.bigint "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_contacts_on_school_id"
  end

  create_table "events", charset: "utf8", force: :cascade do |t|
    t.string "subject", null: false
    t.datetime "start_time", null: false
    t.datetime "ending_time", null: false
    t.string "place", null: false
    t.string "details", null: false
    t.bigint "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_events_on_school_id"
  end

  create_table "messages", charset: "utf8", force: :cascade do |t|
    t.string "text"
    t.boolean "is_user"
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "rooms", charset: "utf8", force: :cascade do |t|
    t.bigint "school_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_rooms_on_school_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "schools", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "facility", null: false
    t.string "ceo", null: false
    t.string "phone", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_schools_on_email", unique: true
    t.index ["facility"], name: "index_schools_on_facility", unique: true
    t.index ["reset_password_token"], name: "index_schools_on_reset_password_token", unique: true
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "facility", null: false
    t.integer "grade", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "phone", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "absences", "users"
  add_foreign_key "contacts", "schools"
  add_foreign_key "events", "schools"
  add_foreign_key "messages", "rooms"
  add_foreign_key "rooms", "schools"
  add_foreign_key "rooms", "users"
end
