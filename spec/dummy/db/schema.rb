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

ActiveRecord::Schema.define(version: 20130915135154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "firefly_bundles", force: true do |t|
    t.string "name", null: false
  end

  add_index "firefly_bundles", ["name"], name: "index_firefly_bundles_on_name", using: :btree

  create_table "firefly_categories", force: true do |t|
    t.string "name", null: false
  end

  add_index "firefly_categories", ["name"], name: "index_firefly_categories_on_name", using: :btree

  create_table "firefly_clients", force: true do |t|
    t.string "name", null: false
  end

  add_index "firefly_clients", ["name"], name: "index_firefly_clients_on_name", using: :btree

  create_table "firefly_events", force: true do |t|
    t.integer  "kind_id",     null: false
    t.integer  "category_id"
    t.integer  "client_id",   null: false
    t.integer  "bundle_id",   null: false
    t.datetime "created_at"
  end

  add_index "firefly_events", ["bundle_id"], name: "index_firefly_events_on_bundle_id", using: :btree
  add_index "firefly_events", ["category_id"], name: "index_firefly_events_on_category_id", using: :btree
  add_index "firefly_events", ["client_id"], name: "index_firefly_events_on_client_id", using: :btree
  add_index "firefly_events", ["kind_id"], name: "index_firefly_events_on_kind_id", using: :btree

  create_table "firefly_kinds", force: true do |t|
    t.string "name", null: false
  end

  add_index "firefly_kinds", ["name"], name: "index_firefly_kinds_on_name", using: :btree

end
