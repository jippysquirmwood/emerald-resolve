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

ActiveRecord::Schema.define(version: 2019_06_13_054051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.json "location", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.bigint "project_id"
    t.index ["author_id"], name: "index_events_on_author_id"
    t.index ["project_id"], name: "index_events_on_project_id"
  end

  create_table "org_projects", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_id"], name: "index_org_projects_on_org_id"
    t.index ["project_id"], name: "index_org_projects_on_project_id"
  end

  create_table "orgs", force: :cascade do |t|
    t.string "name"
    t.json "org_data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.json "location_data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_org_projects", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id"
    t.bigint "org_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_project_id"], name: "index_user_org_projects_on_org_project_id"
    t.index ["user_id"], name: "index_user_org_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "projects"
  add_foreign_key "events", "users", column: "author_id"
  add_foreign_key "org_projects", "orgs"
  add_foreign_key "org_projects", "projects"
  add_foreign_key "user_org_projects", "org_projects"
  add_foreign_key "user_org_projects", "users"
end
