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

ActiveRecord::Schema[7.0].define(version: 2022_06_05_081233) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "enterprise_number", null: false
    t.integer "annual_revenue", null: false
    t.string "legal_name", null: false
    t.boolean "natural_person", default: true, null: false
    t.jsonb "nacebel_codes"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "covers", force: :cascade do |t|
    t.integer "quote_id", null: false
    t.string "name", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nacebel_codes", force: :cascade do |t|
    t.integer "level", null: false
    t.string "code"
    t.string "parent_code"
    t.string "label_en"
    t.string "label_de"
    t.string "label_nl"
    t.string "label_fr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_nacebel_codes_on_code"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "company_id", null: false
    t.boolean "available", default: true, null: false
    t.integer "coverage_ceiling", null: false
    t.integer "deductible", null: false
    t.string "quote_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
