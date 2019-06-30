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

ActiveRecord::Schema.define(version: 2019_06_30_235322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.float "current_price"
    t.float "current_trans_volume"
    t.float "historical_price"
    t.float "historical_trans_volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "symbol"
    t.string "website_slug"
    t.integer "rank"
    t.float "circulating_supply"
    t.float "total_supply"
    t.float "max_supply"
    t.float "volume_24h"
    t.float "market_cap"
    t.float "percent_change_1h"
    t.float "percent_change_24h"
    t.float "percent_change_7d"
  end

  create_table "offers", force: :cascade do |t|
    t.float "price"
    t.float "amount"
    t.bigint "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.boolean "closed", default: false
    t.index ["wallet_id"], name: "index_offers_on_wallet_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.bigint "currency_id"
    t.bigint "wallet_id"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_portfolios_on_currency_id"
    t.index ["wallet_id"], name: "index_portfolios_on_wallet_id"
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "offer_id"
    t.bigint "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_trades_on_offer_id"
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "currency_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_wallets_on_currency_id"
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "offers", "wallets"
  add_foreign_key "portfolios", "currencies"
  add_foreign_key "portfolios", "wallets"
  add_foreign_key "trades", "offers"
  add_foreign_key "trades", "users"
  add_foreign_key "wallets", "currencies"
  add_foreign_key "wallets", "users"
end
