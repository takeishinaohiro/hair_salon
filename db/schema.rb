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

ActiveRecord::Schema.define(version: 2019_12_31_080832) do

  create_table "hairs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.string "image4"
    t.string "day", null: false
    t.string "menber", null: false
    t.integer "money", null: false
    t.string "menu", null: false
    t.string "memo1", null: false
    t.string "memo2", null: false
    t.integer "category", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hairs_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name1", null: false
    t.string "name2", null: false
    t.string "read_name1", null: false
    t.string "read_name2", null: false
    t.string "tel", null: false
    t.string "birthday", null: false
    t.string "station"
    t.string "magazine"
    t.string "rash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "hairs", "users"
end
