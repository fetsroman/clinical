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

ActiveRecord::Schema.define(version: 2019_10_02_132406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.float "total_price", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "category_translations", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["category_id"], name: "index_category_translations_on_category_id"
    t.index ["locale"], name: "index_category_translations_on_locale"
  end

  create_table "item_translations", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "article"
    t.text "description"
    t.json "optionsList", default: "{}", null: false
    t.index ["item_id"], name: "index_item_translations_on_item_id"
    t.index ["locale"], name: "index_item_translations_on_locale"
  end

  create_table "items", force: :cascade do |t|
    t.string "measure"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti"
    t.integer "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "item_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["item_id"], name: "index_line_items_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "discount"
    t.integer "country"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
  end

  add_foreign_key "carts", "users"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "items"
  add_foreign_key "users", "addresses"
end
