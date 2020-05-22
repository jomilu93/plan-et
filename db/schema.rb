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

ActiveRecord::Schema.define(version: 2020_05_21_053125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "name"
    t.text "description"
    t.string "activityable_type", null: false
    t.bigint "activityable_id", null: false
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activityable_type", "activityable_id"], name: "index_activities_on_activityable_type_and_activityable_id"
    t.index ["itinerary_id"], name: "index_activities_on_itinerary_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "rating"
    t.integer "price"
    t.string "phone_number"
    t.bigint "activity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_attractions_on_activity_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "rating"
    t.integer "price"
    t.string "phone_number"
    t.bigint "activity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_hotels_on_activity_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "trip_name"
    t.string "country"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "others", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "cuisine"
    t.integer "rating"
    t.integer "price"
    t.string "phone_number"
    t.bigint "activity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_restaurants_on_activity_id"
  end

  create_table "transits", force: :cascade do |t|
    t.string "transportation_type"
    t.string "origin"
    t.string "destination"
    t.bigint "activity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_transits_on_activity_id"
  end

  create_table "travel_interests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_travel_interests_on_activity_id"
    t.index ["user_id"], name: "index_travel_interests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activities", "itineraries"
  add_foreign_key "attractions", "activities"
  add_foreign_key "friends", "users"
  add_foreign_key "hotels", "activities"
  add_foreign_key "itineraries", "users"
  add_foreign_key "restaurants", "activities"
  add_foreign_key "transits", "activities"
  add_foreign_key "travel_interests", "activities"
  add_foreign_key "travel_interests", "users"
end
