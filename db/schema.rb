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

ActiveRecord::Schema.define(version: 20140516025903) do

  create_table "formularies", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_actions", force: true do |t|
    t.integer  "formulary_id"
    t.boolean  "community_leader"
    t.boolean  "decision_maker"
    t.boolean  "other_research_group"
    t.boolean  "community_group"
    t.boolean  "ngos"
    t.boolean  "business"
    t.boolean  "church"
    t.boolean  "other_participation"
    t.boolean  "municipal_actors"
    t.boolean  "regional_actors"
    t.boolean  "national_actors"
    t.boolean  "other_actors"
    t.boolean  "none_actors"
    t.boolean  "entire_process"
    t.boolean  "research_part"
    t.boolean  "not_participatory_process"
    t.boolean  "factor_affects"
    t.string   "factor_affects_name"
    t.boolean  "implement"
    t.string   "implement_description"
    t.boolean  "new_methodologies"
    t.string   "new_methodologies_description"
    t.boolean  "other_incorporation"
    t.string   "other_incorporation_description"
    t.boolean  "influence"
    t.string   "inlfuence_description"
    t.boolean  "develop_understanding"
    t.boolean  "including_actor"
    t.boolean  "enhancing_participation"
    t.boolean  "improving_communication"
    t.boolean  "other_changes"
    t.boolean  "none_changes"
    t.boolean  "local_impacts"
    t.boolean  "regional_impacts"
    t.boolean  "national_impacts"
    t.boolean  "international_impacts"
    t.boolean  "global_impacts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_contacts", force: true do |t|
    t.string   "formulary_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "project_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_contexts", force: true do |t|
    t.integer  "formulary_id"
    t.text     "scale_description"
    t.boolean  "urban"
    t.boolean  "semiurban"
    t.boolean  "rural"
    t.boolean  "wilderness"
    t.boolean  "disrupted"
    t.boolean  "resource_extraction"
    t.boolean  "environmental_degradation"
    t.boolean  "climate_effect"
    t.boolean  "natural_force"
    t.boolean  "coastal"
    t.boolean  "agricultural"
    t.boolean  "forest"
    t.boolean  "rainfores"
    t.boolean  "cloud_forest"
    t.boolean  "dry_forest"
    t.boolean  "old_growth_forest"
    t.boolean  "mixed_forest"
    t.boolean  "other_scale"
    t.string   "which_scale"
    t.boolean  "watershed"
    t.string   "watersheed_name"
    t.boolean  "wetland"
    t.boolean  "desert"
    t.boolean  "intersectoral_aspect"
    t.string   "intersectoral_aspect_name"
    t.boolean  "political_jurisdiction"
    t.string   "political_jurisdictions_name"
    t.text     "sociopolitical_context"
    t.boolean  "local_context"
    t.string   "local_context_name"
    t.boolean  "project_affect"
    t.string   "project_affect_name"
    t.boolean  "role_consideration"
    t.string   "role_consideration_name"
    t.text     "key_actors"
    t.boolean  "success_consideration"
    t.string   "success_considerantion_name"
    t.integer  "formulary_context_id"
    t.string   "project_term"
    t.boolean  "require_integration"
    t.string   "require_integration_name"
    t.boolean  "gender"
    t.boolean  "equity"
    t.boolean  "community_participation"
    t.boolean  "policy"
    t.boolean  "complexity"
    t.boolean  "other_approach"
    t.string   "which_approach"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_policies", force: true do |t|
    t.integer  "formulary_id"
    t.string   "intersectoral_design"
    t.boolean  "improve_strategies"
    t.boolean  "prevent_strategies"
    t.boolean  "actor_strategies"
    t.boolean  "other"
    t.string   "other_description"
    t.boolean  "multiple_kind"
    t.string   "multiple_kind_name"
    t.text     "improve_policies"
    t.string   "project_result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_profiles", force: true do |t|
    t.integer  "formulary_id"
    t.string   "name"
    t.string   "period"
    t.string   "region"
    t.string   "institution"
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
    t.boolean  "training"
    t.boolean  "other_areas"
    t.string   "which_areas"
    t.boolean  "project"
    t.boolean  "part_program"
    t.boolean  "entire_program"
    t.boolean  "other_project"
    t.string   "which_project"
    t.text     "objective"
    t.text     "discipline"
    t.boolean  "research"
    t.boolean  "action"
    t.boolean  "policy"
    t.text     "success"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulary_researches", force: true do |t|
    t.string   "formulary_id"
    t.boolean  "interaction"
    t.string   "interaction_name"
    t.boolean  "integrate_investigation"
    t.string   "integrate_investigation_yes"
    t.string   "integrate_investigation_no"
    t.boolean  "test_hypothesis"
    t.boolean  "generate_knowledge"
    t.boolean  "inlcude_actor"
    t.boolean  "translate_knowledge"
    t.boolean  "influencing_legislation"
    t.boolean  "no_impact"
    t.boolean  "other_integration"
    t.string   "which_integration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "role_id",                default: 0
    t.boolean  "verified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
