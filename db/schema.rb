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

ActiveRecord::Schema.define(version: 20160613051435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string   "title",                      null: false
    t.string   "leading_photo_file_name"
    t.string   "leading_photo_content_type"
    t.integer  "leading_photo_file_size"
    t.datetime "leading_photo_updated_at"
    t.integer  "user_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "collections", ["title"], name: "index_collections_on_title", using: :btree
  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "consultant_id"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", using: :btree
  add_index "customers", ["name"], name: "index_customers_on_name", using: :btree
  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "item_sizes", force: :cascade do |t|
    t.integer  "item_id",                    null: false
    t.integer  "size",       default: 0,     null: false
    t.boolean  "sold",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "item_sizes", ["item_id"], name: "index_item_sizes_on_item_id", using: :btree
  add_index "item_sizes", ["size"], name: "index_item_sizes_on_size", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "name",                               null: false
    t.integer  "user_id",                            null: false
    t.integer  "collection_id"
    t.boolean  "public",             default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "description"
    t.string   "color"
    t.boolean  "archived",           default: false
  end

  add_index "items", ["collection_id"], name: "index_items_on_collection_id", using: :btree
  add_index "items", ["name"], name: "index_items_on_name", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "sale_items", force: :cascade do |t|
    t.integer  "sale_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sale_items", ["item_id"], name: "index_sale_items_on_item_id", using: :btree
  add_index "sale_items", ["sale_id", "item_id"], name: "index_sale_items_on_sale_id_and_item_id", using: :btree
  add_index "sale_items", ["sale_id"], name: "index_sale_items_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "customer_id"
    t.boolean  "paid",        default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "provider",         null: false
    t.string   "uid",              null: false
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "oauth_token",      null: false
    t.datetime "oauth_expires_at", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
