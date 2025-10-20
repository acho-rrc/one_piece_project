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

ActiveRecord::Schema[8.0].define(version: 2025_10_08_140831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "crews", force: :cascade do |t|
    t.string "name"
    t.string "sea"
    t.string "island"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_crews_on_name", unique: true
  end

  create_table "pirates", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.bigint "bounty"
    t.bigint "crew_id", null: false
    t.string "devil_fruit"
    t.text "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_pirates_on_crew_id"
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.bigint "crew_id", null: false
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_ships_on_crew_id", unique: true
    t.index ["name"], name: "index_ships_on_name", unique: true
  end

  add_foreign_key "pirates", "crews"
  add_foreign_key "ships", "crews"
end
