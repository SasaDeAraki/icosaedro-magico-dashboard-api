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

ActiveRecord::Schema[8.1].define(version: 2026_07_31_164906) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "campaigns", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "system", default: "LANCER", null: false
    t.datetime "updated_at", null: false
    t.index ["system"], name: "index_campaigns_on_system"
  end

  create_table "campaigns_users", id: false, force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.datetime "last_visited"
    t.integer "user_id", null: false
    t.index ["campaign_id", "user_id"], name: "index_campaigns_users_on_campaign_id_and_user_id"
    t.index ["user_id", "campaign_id"], name: "index_campaigns_users_on_user_id_and_campaign_id"
  end

  create_table "characters", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.integer "campaign_id", null: false
    t.string "code_name"
    t.string "color"
    t.datetime "created_at", null: false
    t.integer "current_frame_hp"
    t.integer "current_heat"
    t.integer "current_hp"
    t.integer "current_pd"
    t.integer "current_pe"
    t.integer "current_pilot_hp"
    t.integer "current_reactor"
    t.integer "current_structure"
    t.string "flavor"
    t.string "frame_model"
    t.string "frame_name"
    t.integer "heat_cap"
    t.string "name", null: false
    t.string "resource"
    t.integer "total_frame_hp"
    t.integer "total_hp"
    t.integer "total_pd"
    t.integer "total_pe"
    t.integer "total_pilot_hp"
    t.integer "total_reactor"
    t.integer "total_structure"
    t.string "type"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "active", null: false
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.string "provider"
    t.string "uid"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "characters", "campaigns"
  add_foreign_key "characters", "users"
end
