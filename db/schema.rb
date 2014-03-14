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

ActiveRecord::Schema.define(version: 20140312051812) do

  create_table "formulary_profile_areas", force: true do |t|
    t.integer  "formulary_profile_id"
    t.boolean  "mining"
    t.boolean  "pesticide"
    t.boolean  "occupational_health"
    t.boolean  "community_paticipation"
    t.boolean  "watershed_management"
    t.boolean  "solid_waste_management"
    t.boolean  "public_health"
    t.boolean  "animal_health"
    t.boolean  "determinant_of_health"
    t.boolean  "food_sovereignty"
    t.boolean  "indigenous_health"
    t.boolean  "climate_change"
    t.boolean  "forest_management"
    t.boolean  "other"
    t.string   "which"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_profile_classifies", force: true do |t|
    t.integer  "formulary_profile_id"
    t.boolean  "project"
    t.boolean  "part_program"
    t.boolean  "entire_program"
    t.boolean  "other"
    t.string   "which"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_profile_reaches", force: true do |t|
    t.integer  "formulary_profile_id"
    t.boolean  "research"
    t.boolean  "action"
    t.boolean  "policy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_profiles", force: true do |t|
    t.string   "name"
    t.string   "period"
    t.string   "region"
    t.string   "institution"
    t.text     "description"
    t.text     "objective"
    t.text     "discipline"
    t.text     "success"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
