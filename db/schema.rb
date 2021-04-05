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

ActiveRecord::Schema.define(version: 2021_04_05_035957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.integer "barber_id"
    t.integer "client_id"
    t.boolean "b_accepted"
    t.boolean "c_accepted"
    t.boolean "completed"
  end

  create_table "barber_review_comments", force: :cascade do |t|
    t.text "content"
    t.integer "barber_review_id"
    t.integer "barber_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "barber_reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.integer "barber_id"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "barbers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "zip_code"
    t.string "photo"
    t.string "password_digest"
  end

  create_table "client_review_comments", force: :cascade do |t|
    t.text "content"
    t.integer "client_review_id"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.integer "barber_id"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "zip_code"
    t.string "photo"
  end

  create_table "conversations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "barber_id", null: false
    t.bigint "client_id", null: false
    t.datetime "b_last_read"
    t.datetime "c_last_read"
    t.index ["barber_id"], name: "index_conversations_on_barber_id"
    t.index ["client_id"], name: "index_conversations_on_client_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.bigint "conversation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "barber_id", null: false
    t.bigint "client_id", null: false
    t.string "sent_by"
    t.index ["barber_id"], name: "index_messages_on_barber_id"
    t.index ["client_id"], name: "index_messages_on_client_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "comment"
    t.integer "order"
    t.string "photo"
    t.integer "barber_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "conversations", "barbers"
  add_foreign_key "conversations", "clients"
  add_foreign_key "messages", "barbers"
  add_foreign_key "messages", "clients"
  add_foreign_key "messages", "conversations"
end
