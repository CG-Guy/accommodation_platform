# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_27_111301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street_name"
    t.string "province"
    t.string "city"
    t.string "zip_code"
    t.string "street_address"
    t.string "country"
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composite_type", "composite_id"], name: "index_addresses_on_composite_type_and_composite_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "reference"
    t.string "value"
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composite_type", "composite_id"], name: "index_amenities_on_composite_type_and_composite_id"
  end

  create_table "amenity_items", force: :cascade do |t|
    t.string "value"
    t.string "key"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "reference"
    t.string "attachable_type", null: false
    t.bigint "attachable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
  end

  create_table "blob_validators", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hosts", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_hosts_on_listing_id"
    t.index ["user_id"], name: "index_hosts_on_user_id"
  end

  create_table "information_blocks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composite_type", "composite_id"], name: "index_information_blocks_on_composite_type_and_composite_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.boolean "paid"
    t.datetime "due_date"
    t.string "payment_type"
    t.float "tax"
    t.bigint "user_id", null: false
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composite_type", "composite_id"], name: "index_invoices_on_composite_type_and_composite_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "listing_amenities", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "amenity_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["amenity_item_id"], name: "index_listing_amenities_on_amenity_item_id"
    t.index ["listing_id"], name: "index_listing_amenities_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "mail_settings", force: :cascade do |t|
    t.string "email"
    t.string "address"
    t.string "password"
    t.string "port"
    t.boolean "starttls_auto"
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composite_type", "composite_id"], name: "index_mail_settings_on_composite_type_and_composite_id"
  end

  create_table "navigation_cards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "value"
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.index ["composite_type", "composite_id"], name: "index_ratings_on_composite_type_and_composite_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.bigint "user_id", null: false
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composite_type", "composite_id"], name: "index_reservations_on_composite_type_and_composite_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "value"
    t.bigint "user_id", null: false
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composite_type", "composite_id"], name: "index_reviews_on_composite_type_and_composite_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "site_admins", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_site_admins_on_user_id"
  end

  create_table "sub_listings", force: :cascade do |t|
    t.string "status"
    t.string "price"
    t.string "no_rooms"
    t.string "no_adults"
    t.string "no_children"
    t.string "title"
    t.string "composite_type", null: false
    t.bigint "composite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composite_type", "composite_id"], name: "index_sub_listings_on_composite_type_and_composite_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "hosts", "listings"
  add_foreign_key "hosts", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "listing_amenities", "amenity_items"
  add_foreign_key "listing_amenities", "listings"
  add_foreign_key "listings", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "site_admins", "users"
end
