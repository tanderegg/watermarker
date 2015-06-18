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

ActiveRecord::Schema.define(version: 20150618043111) do

  create_table "images", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name",       default: "", null: false
    t.string   "original",   default: "", null: false
    t.string   "final"
    t.integer  "height",     default: 0,  null: false
    t.integer  "width",      default: 0,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "images", ["project_id"], name: "index_images_on_project_id"

  create_table "payoffs", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name",           default: "", null: false
    t.string   "url",            default: "", null: false
    t.string   "payoff_api_url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "payoffs", ["project_id"], name: "index_payoffs_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        default: "", null: false
    t.string   "description"
    t.string   "client",      default: "", null: false
    t.string   "logo",        default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "regions", force: :cascade do |t|
    t.integer  "image_id"
    t.integer  "payoff_id"
    t.string   "name",                 default: "", null: false
    t.integer  "left",                 default: 0,  null: false
    t.integer  "top",                  default: 0,  null: false
    t.integer  "width",                default: 0,  null: false
    t.integer  "height",               default: 0,  null: false
    t.string   "original",             default: ""
    t.string   "watermark",            default: ""
    t.integer  "watermark_strength",   default: 5,  null: false
    t.integer  "watermark_resolution", default: 50, null: false
    t.string   "link_api_url",         default: ""
    t.string   "trigger_api_url",      default: ""
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "regions", ["image_id"], name: "index_regions_on_image_id"
  add_index "regions", ["payoff_id"], name: "index_regions_on_payoff_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "client_id"
    t.string   "client_sercret"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
