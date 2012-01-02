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

ActiveRecord::Schema.define(:version => 20120102080512) do

  create_table "fonts", :force => true do |t|
    t.string   "font_family"
    t.float    "font_size",         :default => 12.0
    t.string   "heart_font_family"
    t.float    "heart_font_size",   :default => 12.0
    t.string   "star_font_family"
    t.float    "star_font_size",    :default => 12.0
    t.string   "cross_font_family"
    t.float    "cross_font_size",   :default => 12.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fontsets", :force => true do |t|
    t.string   "name"
    t.integer  "l1"
    t.integer  "l2"
    t.integer  "l3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "l1"
    t.string   "l2"
    t.string   "l3"
    t.integer  "fontset_id"
    t.integer  "project_id"
    t.boolean  "done",       :default => false
    t.string   "lot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.text     "template"
    t.integer  "num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
