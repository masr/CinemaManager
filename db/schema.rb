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

ActiveRecord::Schema.define(:version => 20110226042527) do

  create_table "film", :force => true do |t|
    t.integer  "price"
    t.integer  "seats_remain"
    t.integer  "full_seats"
    t.string   "name"
    t.text     "description"
    t.string   "pic_name"
    t.integer  "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_film_count"
    t.boolean  "sex",              :default => false
    t.integer  "age"
    t.string   "address"
    t.boolean  "is_admin",         :default => false
    t.text     "description"
    t.boolean  "status"
  end

  create_table "order", :force => true do |t|
    t.integer "member_id"
    t.integer "film_id"
    t.integer "seat_num"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
