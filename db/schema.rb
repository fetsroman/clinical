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

ActiveRecord::Schema.define(version: 2020_04_13_134010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banner_parameters", force: :cascade do |t|
    t.string "article"
    t.integer "discount"
    t.bigint "banner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banner_id"], name: "index_banner_parameters_on_banner_id"
  end

  create_table "banners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "link"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title_uk"
    t.string "title_ru"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "number"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "description_uk"
    t.text "description_ru"
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
    t.string "article"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["item_id"], name: "index_line_items_on_item_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "article"
    t.float "price_rub"
    t.float "price_uah"
    t.string "volume"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_options_on_item_id"
  end

  create_table "refresh_token_whitelists", force: :cascade do |t|
    t.string "token"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telegram_bots", force: :cascade do |t|
    t.integer "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.integer "discount"
    t.integer "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "banner_parameters", "banners"
  add_foreign_key "carts", "users"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "items"
  add_foreign_key "options", "items"
end
