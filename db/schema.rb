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

ActiveRecord::Schema.define(:version => 20130112010149) do

  create_table "board_documents", :force => true do |t|
    t.integer  "project_id"
    t.string   "approval"
    t.string   "mark"
    t.date     "date"
    t.string   "location"
    t.time     "time"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "location2"
    t.string   "city"
    t.string   "tipo"
    t.string   "atadigital_file_name"
    t.string   "atadigital_content_type"
    t.integer  "atadigital_file_size"
    t.datetime "atadigital_updated_at"
  end

  create_table "board_members", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "instituicao"
    t.string   "tipo"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "project_id"
    t.string   "token"
    t.boolean  "confirmed"
    t.boolean  "selected"
    t.integer  "board_document_id"
  end

  create_table "duedates", :force => true do |t|
    t.date     "orientation_start"
    t.date     "orientation_end"
    t.date     "evaluation_start"
    t.date     "evaluation_end"
    t.date     "board_start"
    t.date     "board_end"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "trimestre"
    t.boolean  "terminado"
    t.boolean  "finalizado"
  end

  create_table "evaluations", :force => true do |t|
    t.string   "answer1"
    t.string   "answer2"
    t.string   "answer3"
    t.string   "answer4"
    t.string   "answer5"
    t.string   "answer6"
    t.string   "answer7"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "confirmed"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "notifications", :force => true do |t|
    t.text     "details"
    t.string   "author"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  create_table "projects", :force => true do |t|
    t.integer  "aluno_id"
    t.integer  "orientador_id"
    t.string   "title"
    t.string   "description"
    t.string   "course"
    t.integer  "status"
    t.string   "pdf"
    t.integer  "board_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "observation"
    t.date     "board_date"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.boolean  "groupstate"
    t.boolean  "group_confirm",     :default => false
    t.string   "board_location"
    t.time     "boad_time"
    t.boolean  "boad_invitation"
    t.boolean  "ata_confirm"
    t.integer  "duedate_id"
    t.boolean  "avaliation_type"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "role"
    t.string   "location"
    t.integer  "ra"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
