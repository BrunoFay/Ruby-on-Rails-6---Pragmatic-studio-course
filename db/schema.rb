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

ActiveRecord::Schema.define(version: 2023_01_10_174252) do

  create_table "characterizations", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_characterizations_on_film_id"
    t.index ["genre_id"], name: "index_characterizations_on_genre_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_favorites_on_film_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.text "description"
    t.date "realeased_on"
    t.string "rating"
    t.date "released_on"
    t.string "director"
    t.string "duration"
    t.string "image_file_name", default: "placeholder.png"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.text "comment"
    t.string "text"
    t.integer "film_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["film_id"], name: "index_reviews_on_film_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.boolean "admin", default: false
  end

  add_foreign_key "characterizations", "films"
  add_foreign_key "characterizations", "genres"
  add_foreign_key "favorites", "films"
  add_foreign_key "favorites", "users"
  add_foreign_key "reviews", "films"
end
