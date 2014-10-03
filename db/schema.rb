# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141003230252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lines", force: true do |t|
    t.integer  "station1"
    t.integer  "station2"
    t.integer  "line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lines", ["station1"], name: "index_lines_on_station1", using: :btree
  add_index "lines", ["station2"], name: "index_lines_on_station2", using: :btree

  create_table "metro_routes", force: true do |t|
    t.integer  "line"
    t.string   "name"
    t.string   "colour"
    t.string   "stripe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metro_routes", ["line"], name: "index_metro_routes_on_line", using: :btree

  create_table "stations", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.text     "display_name"
    t.float    "zone"
    t.integer  "total_lines"
    t.integer  "rail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
