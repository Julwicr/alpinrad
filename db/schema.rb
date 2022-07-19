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

ActiveRecord::Schema[7.0].define(version: 2022_07_06_134012) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "category", ["dropoff", "pickup", "popup"]
  create_enum "size", ["S", "M", "L", "XL"]
  create_enum "state", ["excellent", "good", "need_repair", "urgent_repair"]
  create_enum "status", ["ok", "cancel", "pending"]

  create_table "bike_selections", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "bike_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_bike_selections_on_bike_id"
    t.index ["booking_id"], name: "index_bike_selections_on_booking_id"
  end

  create_table "bikes", force: :cascade do |t|
    t.enum "category", enum_type: "category"
    t.float "weight"
    t.enum "size", enum_type: "size"
    t.enum "state", enum_type: "state"
    t.integer "price_per_day"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_bikes_on_station_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "station_id", null: false
    t.enum "status", default: "pending", null: false, enum_type: "status"
    t.integer "total_price"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_bookings_on_station_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "station_schedules", force: :cascade do |t|
    t.bigint "station_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_station_schedules_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.enum "category", enum_type: "category"
    t.text "description"
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "bike_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bike_selections", "bikes"
  add_foreign_key "bike_selections", "bookings"
  add_foreign_key "bikes", "stations"
  add_foreign_key "bookings", "stations"
  add_foreign_key "bookings", "users"
  add_foreign_key "station_schedules", "stations"
end
