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

ActiveRecord::Schema.define(version: 20150927164203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "paths", force: :cascade do |t|
    t.string   "yt_description"
    t.string   "yt_id"
    t.string   "yt_title"
    t.string   "tag"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "yt_description"
    t.string   "yt_duration"
    t.string   "yt_embed_html"
    t.string   "yt_id"
    t.string   "yt_published_at"
    t.string   "yt_thumbnail_url"
    t.string   "yt_title"
    t.string   "brief"
    t.integer  "path_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "videos", ["path_id"], name: "index_videos_on_path_id", using: :btree

  add_foreign_key "videos", "paths"
end
