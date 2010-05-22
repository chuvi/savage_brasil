# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100522230830) do

  create_table "assets", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "description"
    t.integer  "user_id"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
    t.string   "type"
    t.string   "title"
  end

  create_table "comments", :force => true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "message"
    t.integer  "user_id"
    t.integer  "image_id"
    t.integer  "comment_id"
    t.integer  "map_id"
    t.integer  "demo_id"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "description"
    t.string   "dimensions"
    t.string   "status"
    t.integer  "teams"
    t.integer  "flags"
    t.integer  "gold_mines"
    t.integer  "red_mines"
    t.integer  "npcs"
    t.integer  "chiprels"
    t.string   "category"
    t.string   "newerth_link"
    t.integer  "derived_from_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "shouts", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                 :null => false
    t.string   "name"
    t.string   "email"
    t.boolean  "admin",              :default => false
    t.string   "crypted_password"
    t.string   "persistence_token"
    t.boolean  "enabled",            :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "login_count",        :default => 0,     :null => false
    t.integer  "failed_login_count", :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "main_uid"
  end

end
