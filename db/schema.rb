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

ActiveRecord::Schema.define(version: 20180125170409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_requests", force: :cascade do |t|
    t.string "military_registration", null: false
    t.string "document_reference", null: false
    t.integer "reason_request", null: false
    t.boolean "canceled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_statuses", force: :cascade do |t|
    t.string "describe", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name", null: false
    t.string "identification", null: false
    t.string "hierarchy", null: false
    t.string "father_name"
    t.string "mother_name"
    t.date "born_date", null: false
    t.string "registration", null: false
    t.string "naturalness", null: false
    t.string "vote_number", null: false
    t.string "vote_zone", null: false
    t.string "vote_section", null: false
    t.string "cpf", null: false
    t.string "digital_factor", null: false
    t.string "blood_type", null: false
    t.string "blood_factor", null: false
    t.boolean "carry_weapon", null: false
    t.string "print_locale", null: false
    t.date "print_date", null: false
    t.date "expire_date", null: false
    t.string "card_number"
    t.boolean "returned_card", default: false, null: false
    t.bigint "card_request_id"
    t.bigint "card_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_request_id"], name: "index_cards_on_card_request_id"
    t.index ["card_status_id"], name: "index_cards_on_card_status_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "discards", force: :cascade do |t|
    t.string "card_number", null: false
    t.bigint "card_request_id", null: false
    t.text "reason_discard", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_request_id"], name: "index_discards_on_card_request_id"
  end

  create_table "hierarchies", force: :cascade do |t|
    t.string "name", null: false
    t.string "acronym", null: false
    t.integer "rank", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "militaries", force: :cascade do |t|
    t.string "name", null: false
    t.string "identification", null: false
    t.bigint "hierarchy_id", null: false
    t.string "father_name"
    t.string "mother_name"
    t.date "born_date", null: false
    t.string "registration", null: false
    t.string "naturalness", null: false
    t.string "vote_number", null: false
    t.string "vote_zone", null: false
    t.string "vote_section", null: false
    t.string "cpf", null: false
    t.string "digital_factor", null: false
    t.integer "blood_type", null: false
    t.integer "blood_factor", null: false
    t.boolean "carry_weapon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hierarchy_id"], name: "index_militaries_on_hierarchy_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "acronym", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "card_requests"
  add_foreign_key "cards", "card_statuses"
  add_foreign_key "cities", "states"
  add_foreign_key "discards", "card_requests"
  add_foreign_key "militaries", "hierarchies"
end
