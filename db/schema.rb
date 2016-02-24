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

ActiveRecord::Schema.define(version: 20160224143159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "description",                         null: false
    t.string   "location",                            null: false
    t.string   "status_update"
    t.integer  "owner_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "developer_id"
    t.string   "status",        default: "Available"
  end

  add_index "businesses", ["developer_id"], name: "index_businesses_on_developer_id", using: :btree
  add_index "businesses", ["owner_id"], name: "index_businesses_on_owner_id", using: :btree

  create_table "businesses_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers_skills", force: :cascade do |t|
    t.integer  "developer_id"
    t.integer  "skill_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "matched_user_id"
    t.string   "accepted",        default: "false"
    t.string   "status",          default: "Pending"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "matches", ["matched_user_id"], name: "index_matches_on_matched_user_id", using: :btree
  add_index "matches", ["user_id", "matched_user_id"], name: "index_matches_on_user_id_and_matched_user_id", unique: true, using: :btree
  add_index "matches", ["user_id"], name: "index_matches_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "status_update_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["business_id"], name: "index_photos_on_business_id", using: :btree
  add_index "photos", ["status_update_id"], name: "index_photos_on_status_update_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "comment",              null: false
    t.integer  "communication_rating", null: false
    t.integer  "quality_rating",       null: false
    t.integer  "timeliness_rating",    null: false
    t.string   "review_type",          null: false
    t.integer  "reviewee_id"
    t.integer  "reviewer_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reviews", ["reviewee_id"], name: "index_reviews_on_reviewee_id", using: :btree
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_updates", force: :cascade do |t|
    t.string   "description",                 null: false
    t.integer  "business_id",                 null: false
    t.string   "percentage_revenue_increase"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          null: false
    t.string   "last_name",           null: false
    t.string   "password_digest",     null: false
    t.string   "description"
    t.string   "location"
    t.string   "type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "skype_id"
    t.string   "slack_id"
    t.string   "phone_number"
  end

  add_foreign_key "matches", "users"
  add_foreign_key "matches", "users", column: "matched_user_id"
end
