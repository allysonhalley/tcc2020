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

ActiveRecord::Schema.define(version: 20180121041803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_requests", force: :cascade do |t|
    t.string "military_registration"
    t.string "document_reference"
    t.integer "reason_request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_statuses", force: :cascade do |t|
    t.string "describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "identification"
    t.string "hierarchy"
    t.string "father_name"
    t.string "mother_name"
    t.date "born_date"
    t.string "registration"
    t.string "naturalness"
    t.string "vote_number"
    t.string "vote_zone"
    t.string "vote_section"
    t.string "cpf"
    t.string "digital_factor"
    t.string "blood_type"
    t.string "blood_factor"
    t.boolean "carry_weapon"
    t.string "print_locale"
    t.date "print_date"
    t.date "expire_date"
    t.string "card_number"
    t.boolean "returned_card"
    t.bigint "card_request_id"
    t.bigint "card_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_request_id"], name: "index_cards_on_card_request_id"
    t.index ["card_status_id"], name: "index_cards_on_card_status_id"
  end

  create_table "discards", force: :cascade do |t|
    t.string "card_number"
    t.bigint "card_request_id"
    t.text "reason_discard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_request_id"], name: "index_discards_on_card_request_id"
  end

  create_table "hierarchies", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "militaries", force: :cascade do |t|
    t.string "name"
    t.string "identification"
    t.bigint "hierarchy_id"
    t.string "father_name"
    t.string "mother_name"
    t.date "born_date"
    t.string "registration"
    t.string "naturalness"
    t.string "vote_number"
    t.string "vote_zone"
    t.string "vote_section"
    t.string "cpf"
    t.string "digital_factor"
    t.integer "blood_type"
    t.integer "blood_factor"
    t.boolean "carry_weapon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hierarchy_id"], name: "index_militaries_on_hierarchy_id"
  end

  add_foreign_key "cards", "card_requests"
  add_foreign_key "cards", "card_statuses"
  add_foreign_key "discards", "card_requests"
  add_foreign_key "militaries", "hierarchies"
end
