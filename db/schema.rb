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

ActiveRecord::Schema.define(version: 2018_11_16_161605) do

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

  create_table "comments", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "project_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["project_id"], name: "index_comments_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "deadline_on"
    t.integer "bid"
    t.integer "status"
    t.boolean "is_paid"
    t.bigint "requested_by_id"
    t.bigint "authorized_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorized_by_id"], name: "index_projects_on_authorized_by_id"
    t.index ["requested_by_id"], name: "index_projects_on_requested_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "projects", "users", column: "authorized_by_id"
  add_foreign_key "projects", "users", column: "requested_by_id"
end
