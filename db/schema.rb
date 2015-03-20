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

ActiveRecord::Schema.define(version: 20150320065326) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "option_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "time",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.string   "content",     limit: 255
    t.boolean  "correct",     limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "lesson_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "lesson_id",  limit: 4
    t.integer  "answer_id",  limit: 4
    t.integer  "mark",       limit: 4
    t.boolean  "is_started", limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "avatar",          limit: 255
    t.string   "role",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
