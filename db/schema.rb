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

ActiveRecord::Schema.define(version: 20221116032104) do

  create_table "applications", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "citizenship"
    t.string "gender"
    t.string "research_area"
    t.string "degree_obj"
    t.string "degree_obj_major"
    t.string "ug_inst"
    t.string "ug_inst_city"
    t.string "ug_gpa"
    t.string "ug_deg_earned"
    t.string "grad_inst"
    t.string "grad_inst_city"
    t.string "grad_gpa"
    t.string "grad_deg_earned"
    t.string "recommender_1"
    t.string "recommender_2"
    t.string "recommender_3"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.string  "AppStatus"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "password"
    t.text     "email"
    t.text     "address"
    t.text     "phone"
    t.text     "lname"
    t.text     "fname"
  end

end
