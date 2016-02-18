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

ActiveRecord::Schema.define(version: 20160218221817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "description",   null: false
    t.string   "images"
    t.string   "location",      null: false
    t.string   "category",      null: false
    t.string   "status_update"
    t.integer  "owner_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "businesses", ["owner_id"], name: "index_businesses_on_owner_id", using: :btree

  create_table "developers", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "description"
    t.string   "avatar"
    t.string   "location"
    t.string   "contact_info"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content",      null: false
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "messages", ["from_user_id"], name: "index_messages_on_from_user_id", using: :btree
  add_index "messages", ["to_user_id"], name: "index_messages_on_to_user_id", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "description"
    t.string   "skills"
    t.string   "avatar"
    t.string   "location"
    t.string   "contact_info"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

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

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "description",     null: false
    t.string   "skills"
    t.string   "avatar"
    t.string   "location"
    t.string   "contact_info",    null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
  end

end
