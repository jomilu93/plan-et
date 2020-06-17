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

ActiveRecord::Schema.define(version: 2020_06_13_211459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "city_id", null: false
    t.bigint "hotel_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_accomodations_on_city_id"
    t.index ["hotel_id"], name: "index_accomodations_on_hotel_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "part_id", null: false
    t.string "activityable_type", null: false
    t.bigint "activityable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activityable_type", "activityable_id"], name: "index_activities_on_activityable_type_and_activityable_id"
    t.index ["part_id"], name: "index_activities_on_part_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "attraction_type"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_attractions_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "pais_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["pais_id"], name: "index_cities_on_pais_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.integer "rating"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_hotels_on_city_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "city_id", null: false
    t.bigint "restaurant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_meals_on_city_id"
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id"
  end

  create_table "others", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_others_on_city_id"
  end

  create_table "pais", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "region"
    t.string "subregion"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.bigint "city_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["city_id"], name: "index_parts_on_city_id"
    t.index ["trip_id"], name: "index_parts_on_trip_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "cuisine"
    t.integer "rating"
    t.integer "avg_price"
    t.string "business_hours"
    t.string "address"
    t.string "phone_number"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_restaurants_on_city_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.string "transportation_type"
    t.bigint "origin_city_id", null: false
    t.bigint "destination_city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination_city_id"], name: "index_transportations_on_destination_city_id"
    t.index ["origin_city_id"], name: "index_transportations_on_origin_city_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cities", default: [], array: true
    t.string "countries", default: [], array: true
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accomodations", "cities"
  add_foreign_key "accomodations", "hotels"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "parts"
  add_foreign_key "attractions", "cities"
  add_foreign_key "cities", "pais", column: "pais_id"
  add_foreign_key "hotels", "cities"
  add_foreign_key "meals", "cities"
  add_foreign_key "meals", "restaurants"
  add_foreign_key "others", "cities"
  add_foreign_key "parts", "cities"
  add_foreign_key "parts", "trips"
  add_foreign_key "restaurants", "cities"
  add_foreign_key "transportations", "cities", column: "destination_city_id"
  add_foreign_key "transportations", "cities", column: "origin_city_id"
  add_foreign_key "trips", "users"
end
