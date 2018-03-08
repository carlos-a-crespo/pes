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

ActiveRecord::Schema.define(version: 20180227194345) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "news_letter_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.         "featured"
    t.index ["news_letter_id"], name: "index_articles_on_news_letter_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "color",      limit: 7,  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["name"], name: "index_event_types_on_name", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",         limit: 100, null: false
    t.string   "description"
    t.datetime "start",                     null: false
    t.datetime "end",                       null: false
    t.integer  "event_type_id",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
  end

  create_table "news_letters", force: :cascade do |t|
    t.integer  "month"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
