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

ActiveRecord::Schema.define(:version => 20100512134058) do

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
