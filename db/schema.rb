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

ActiveRecord::Schema[7.1].define(version: 2024_05_15_203152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authie_sessions", force: :cascade do |t|
    t.string "token"
    t.string "browser_id"
    t.bigint "user_id"
    t.boolean "active", default: true, null: false
    t.text "data"
    t.datetime "expires_at", precision: nil
    t.datetime "login_at", precision: nil
    t.string "login_ip"
    t.datetime "last_activity_at", precision: nil
    t.string "last_activity_ip"
    t.string "last_activity_path"
    t.string "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user_type"
    t.bigint "parent_id"
    t.datetime "two_factored_at", precision: nil
    t.string "two_factored_ip"
    t.integer "requests", default: 0
    t.datetime "password_seen_at", precision: nil
    t.string "token_hash"
    t.string "host"
    t.boolean "skip_two_factor", default: false, null: false
    t.string "login_ip_country"
    t.string "two_factored_ip_country"
    t.string "last_activity_ip_country"
    t.index ["browser_id"], name: "index_authie_sessions_on_browser_id"
    t.index ["token"], name: "index_authie_sessions_on_token"
    t.index ["token_hash"], name: "index_authie_sessions_on_token_hash"
    t.index ["user_id"], name: "index_authie_sessions_on_user_id"
  end

end
