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

ActiveRecord::Schema.define(version: 20161126193120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string  "fuel_type",                   null: false
    t.string  "plate",                       null: false
    t.string  "model",                       null: false
    t.integer "year",                        null: false
    t.integer "fuel_capacity", default: 100, null: false
    t.string  "manufacturer",                null: false
    t.integer "odometer",      default: 0,   null: false
  end

  create_table "series", force: :cascade do |t|
  end

  create_table "supplies", force: :cascade do |t|
    t.string  "fuel_type",         null: false
    t.integer "odometer_from_car", null: false
    t.integer "fuel_quantity",     null: false
    t.integer "total_cost",        null: false
    t.integer "cost_liter",        null: false
    t.integer "series_id",         null: false
  end

end
