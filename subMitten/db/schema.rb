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

ActiveRecord::Schema.define(version: 20150124032434) do

  create_table "journals", force: true do |t|
    t.string   "name",         null: false
    t.string   "email"
    t.text     "address"
    t.boolean  "simul_submit"
    t.string   "url"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journals", ["name"], name: "index_journals_on_name", unique: true

  create_table "poems", force: true do |t|
    t.string   "title",                       null: false
    t.string   "status",     default: "NONE", null: false
    t.datetime "written_on",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submission_poems", force: true do |t|
    t.integer  "submission_id",                     null: false
    t.integer  "poem_id",                           null: false
    t.string   "result",        default: "PENDING"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submission_poems", ["poem_id"], name: "index_submission_poems_on_poem_id"
  add_index "submission_poems", ["submission_id", "poem_id"], name: "index_submission_poems_on_submission_id_and_poem_id", unique: true
  add_index "submission_poems", ["submission_id"], name: "index_submission_poems_on_submission_id"

  create_table "submissions", force: true do |t|
    t.integer  "journal_id",                     null: false
    t.datetime "date_made",                      null: false
    t.string   "result",     default: "PENDING"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["journal_id"], name: "index_submissions_on_journal_id"

end
