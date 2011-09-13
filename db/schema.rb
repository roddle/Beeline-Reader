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

ActiveRecord::Schema.define(:version => 20110819202331) do

  create_table "beelines", :force => true do |t|
    t.string   "reader"
    t.decimal  "normal_time"
    t.decimal  "beeline_time"
    t.integer  "rating"
    t.integer  "flag"
    t.integer  "read_id"
    t.datetime "created_at",   :default => '2011-08-19 20:25:44'
    t.datetime "updated_at"
    t.string   "e_mail"
  end

  create_table "charts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "read_items", :force => true do |t|
    t.integer  "beeline_id"
    t.integer  "chart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reads", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "reading"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "last_read"
    t.integer  "total_reads"
    t.datetime "updated_at"
    t.integer  "word_count"
  end

end
