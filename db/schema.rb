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

ActiveRecord::Schema.define(version: 2021_02_14_015020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.string "name"
    t.integer "creditLevel", default: [], array: true
    t.string "calcType"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_set_id"
    t.index ["game_set_id"], name: "index_occupations_on_game_set_id"
  end

  create_table "occupations_picks", id: false, force: :cascade do |t|
    t.bigint "occupation_id", null: false
    t.bigint "pick_id", null: false
  end

  create_table "occupations_skills", id: false, force: :cascade do |t|
    t.bigint "occupation_id", null: false
    t.bigint "skill_id", null: false
  end

  create_table "picks", force: :cascade do |t|
    t.integer "numberOfPicks"
    t.boolean "pickAny"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_set_id"
    t.index ["game_set_id"], name: "index_picks_on_game_set_id"
  end

  create_table "picks_skills", id: false, force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "pick_id", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "baseValue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_set_id"
    t.index ["game_set_id"], name: "index_skills_on_game_set_id"
  end

end
