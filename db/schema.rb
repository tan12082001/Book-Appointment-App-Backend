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

ActiveRecord::Schema[7.1].define(version: 2023_12_02_011518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", primary_key: "car_id", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "priceperhr"
    t.integer "seating_capacity"
    t.integer "rental_duration"
  end
  
  create_table "myreservation", primary_key: "reservation_id", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "car_id"
    t.timestamptz "reservation_date"
  end

  create_table "users", primary_key: "user_id", id: :serial, force: :cascade do |t|
    t.string "username", limit: 255, null: false
    t.string "email", limit: 255, null: false
  end

  add_foreign_key "myreservation", "cars", primary_key: "car_id", name: "myreservation_car_id_fkey"
  add_foreign_key "myreservation", "users", primary_key: "user_id", name: "myreservation_user_id_fkey"
end
