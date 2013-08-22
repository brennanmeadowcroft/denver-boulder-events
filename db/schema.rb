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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130821050757) do

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.string   "location"
    t.text     "notes"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "frequency"
    t.datetime "recurrence_end_date"
    t.integer  "recurrence_end_count"
    t.string   "recurrence_day"
    t.integer  "recurrence_frequency"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "events_tags", :force => true do |t|
    t.integer "event_id"
    t.integer "tag_id"
  end

  create_table "requests", :force => true do |t|
    t.string   "email"
    t.binary   "approved"
    t.binary   "validated"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "verification_code"
    t.string   "ics_token"
  end

  add_index "requests", ["ics_token"], :name => "index_requests_on_ics_token"

  create_table "suggestions", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
