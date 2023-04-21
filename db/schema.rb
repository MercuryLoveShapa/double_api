# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_20_101437) do
  create_table "double_announcements", charset: "utf8", force: :cascade do |t|
    t.string "title", limit: 100
    t.text "content"
    t.date "publish_time"
    t.date "cancel_time"
  end

  create_table "double_competitors", charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "gender", limit: 5, null: false
    t.bigint "number", null: false
    t.bigint "card_number", null: false
    t.bigint "double_user_id"
    t.bigint "double_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "double_criteria", charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 20
    t.string "value"
    t.float "score"
  end

  create_table "double_industries", charset: "utf8", force: :cascade do |t|
    t.string "industry"
  end

  create_table "double_judge_double_project_concerns", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "double_judge_id"
    t.integer "double_project_id"
  end

  create_table "double_judges", charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "password"
    t.string "email", limit: 50, null: false
    t.string "true_name", limit: 20, null: false
    t.bigint "number", null: false
    t.string "card_number", limit: 40, null: false
    t.bigint "gender", null: false
    t.string "description"
    t.bigint "sys_roles_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "double_matches", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "theme", limit: 50
    t.string "area", limit: 50
    t.string "reward"
    t.date "begin_time"
    t.date "end_time"
  end

  create_table "double_projects", charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.text "description"
    t.string "organization", limit: 20
    t.string "leader", limit: 10
    t.bigint "leader_number"
    t.bigint "double_industry_id"
  end

  create_table "double_results", charset: "utf8", force: :cascade do |t|
    t.float "grade"
    t.string "comment"
    t.boolean "promotion"
    t.bigint "double_project_id"
    t.bigint "double_judge_id"
    t.bigint "double_schedule_id"
  end

  create_table "double_schedule_double_judges", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "double_schedule_id"
    t.integer "double_judge_id"
  end

  create_table "double_schedules", charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.date "begin_time"
    t.date "end_time"
    t.string "manner"
    t.string "demand"
    t.bigint "double_match_id", null: false
    t.bigint "double_criteria_id", null: false
  end

  create_table "double_schedules_double_projects", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "double_schedule_id"
    t.integer "double_project_id"
    t.index ["double_schedule_id", "double_project_id"], name: "index_double_schedule_double_projects", unique: true
  end

  create_table "double_users", charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "password"
    t.string "email", limit: 50, null: false
    t.string "true_name", limit: 20, null: false
    t.bigint "number", null: false
    t.bigint "sys_roles_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sys_action_permissions", charset: "utf8", force: :cascade do |t|
    t.string "permission_name", limit: 120, null: false
    t.string "permission_value", limit: 120, null: false
    t.string "description"
    t.integer "parent_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_name"], name: "index_sys_action_permissions_on_permission_name"
  end

  create_table "sys_action_permissions_sys_roles", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "sys_action_permission_id"
    t.integer "sys_role_id"
    t.index ["sys_action_permission_id", "sys_role_id"], name: "index_sys_action_permissions_sys_roles_permissions_roles", unique: true
  end

  create_table "sys_logs", charset: "utf8", force: :cascade do |t|
    t.string "utype", limit: 100
    t.string "username", limit: 100
    t.string "ip_addr", limit: 100
    t.string "action_type", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sys_roles", charset: "utf8", force: :cascade do |t|
    t.string "role_name"
    t.string "description"
  end

  create_table "sys_users", charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "password"
    t.string "true_name", limit: 20, null: false
    t.string "email", limit: 50
    t.string "description"
    t.string "utype"
    t.bigint "sys_roles_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
