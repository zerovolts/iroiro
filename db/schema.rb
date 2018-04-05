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

ActiveRecord::Schema.define(version: 20180402205524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.integer "color_data", null: false
    t.float "hue"
    t.float "sat"
    t.float "lum"
    t.index ["color_data"], name: "index_colors_on_color_data"
  end

  create_table "pallette_colors", force: :cascade do |t|
    t.bigint "color_id"
    t.bigint "pallette_id"
    t.index ["color_id"], name: "index_pallette_colors_on_color_id"
    t.index ["pallette_id"], name: "index_pallette_colors_on_pallette_id"
  end

  create_table "pallettes", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_pallettes_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login"
  end

end
