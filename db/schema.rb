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

ActiveRecord::Schema.define(version: 20160424195030) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "name"
    t.string   "surname"
    t.string   "password_digest"
    t.string   "email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "drug_prescriptions", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.date     "date"
    t.decimal  "dosage",     precision: 3, scale: 1
    t.integer  "patient_id"
  end

  create_table "inr_records", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.date     "date"
    t.decimal  "inr_value",  precision: 3, scale: 1
    t.integer  "patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "name"
    t.string   "surname"
    t.string   "password_digest"
    t.string   "birthdate"
    t.string   "email"
    t.integer  "doctor_id"
    t.integer  "risk"
    t.integer  "desired_inr"
    t.decimal  "initial_dose",        precision: 3, scale: 1
    t.integer  "therapy_state"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
