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

ActiveRecord::Schema.define(version: 2022_06_06_174541) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "buckets", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_buckets_on_project_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["project_id"], name: "index_chat_rooms_on_project_id"
  end

  create_table "chat_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_room_id", null: false
    t.datetime "enter_at", default: "2024-11-13 06:33:44"
    t.integer "unread_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_room_id"], name: "index_chat_users_on_chat_room_id"
    t.index ["user_id"], name: "index_chat_users_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.bigint "message_id"
    t.bigint "user_id"
    t.text "content"
    t.index ["message_id"], name: "index_comments_on_message_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image_data"
    t.text "avatar", default: "default_user"
    t.bigint "user_id"
    t.string "contentable_type"
    t.bigint "contentable_id"
    t.index ["contentable_type", "contentable_id"], name: "index_contents_on_contentable"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.text "document_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bucket_id"
    t.index ["bucket_id"], name: "index_documents_on_bucket_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.bigint "project_id"
    t.string "slug"
    t.text "content"
    t.index ["project_id"], name: "index_messages_on_project_id"
  end

  create_table "personals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "teammate"
    t.index ["project_id"], name: "index_personals_on_project_id"
    t.index ["user_id"], name: "index_personals_on_user_id"
  end

  create_table "private_chats", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "roomname"
    t.index ["project_id"], name: "index_private_chats_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "nickname"
    t.datetime "created_at", precision: 3, null: false
    t.datetime "updated_at", precision: 3, null: false
    t.string "title"
    t.text "description"
    t.string "slug"
    t.string "imageurl"
    t.text "image_data"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.integer "calendar_id"
    t.datetime "start"
    t.datetime "end"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_id"
    t.string "name"
    t.index ["project_id"], name: "index_schedules_on_project_id"
  end

  create_table "todo_items", force: :cascade do |t|
    t.text "description", null: false
    t.boolean "completed"
    t.datetime "completed_at"
    t.bigint "todo_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["todo_list_id"], name: "index_todo_items_on_todo_list_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_id"
    t.string "status", default: "todos"
    t.integer "position"
    t.datetime "start"
    t.index ["project_id"], name: "index_todo_lists_on_project_id"
  end

  create_table "user_privates", force: :cascade do |t|
    t.bigint "private_chat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "unread_count", default: 0
    t.datetime "enter_at", default: "2024-11-13 06:33:44"
    t.index ["private_chat_id"], name: "index_user_privates_on_private_chat_id"
    t.index ["user_id"], name: "index_user_privates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "role", default: "user"
    t.string "nickname"
    t.string "slug"
    t.string "imageurl", default: "default_user"
    t.text "avatar_data"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buckets", "projects"
  add_foreign_key "chat_rooms", "projects"
  add_foreign_key "chat_users", "chat_rooms"
  add_foreign_key "chat_users", "users"
  add_foreign_key "comments", "messages"
  add_foreign_key "comments", "users"
  add_foreign_key "contents", "users"
  add_foreign_key "documents", "buckets"
  add_foreign_key "messages", "projects"
  add_foreign_key "personals", "projects"
  add_foreign_key "personals", "users"
  add_foreign_key "private_chats", "projects"
  add_foreign_key "schedules", "projects"
  add_foreign_key "todo_items", "todo_lists"
  add_foreign_key "todo_lists", "projects"
  add_foreign_key "user_privates", "private_chats"
  add_foreign_key "user_privates", "users"
end
