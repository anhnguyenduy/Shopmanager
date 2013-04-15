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

ActiveRecord::Schema.define(:version => 20130412102356) do

  create_table "carts", :force => true do |t|
    t.integer  "product_id"
    t.string   "name_product"
    t.integer  "price_product"
    t.integer  "number_product"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "total_price"
  end

  add_index "carts", ["product_id"], :name => "index_carts_on_product_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "remember_token"
  end

  add_index "categories", ["remember_token"], :name => "index_categories_on_remember_token"

  create_table "orderdetails", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "price_product"
    t.integer  "number_product"
    t.integer  "total_price"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "number_product"
    t.integer  "total_price"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "address"
    t.string   "phone"
    t.string   "note"
    t.string   "status"
  end

  add_index "orders", ["user_id", "created_at"], :name => "index_orders_on_user_id_and_created_at"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image_url"
    t.string   "description"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
