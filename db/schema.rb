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

ActiveRecord::Schema.define(version: 20161102155706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"
  enable_extension "uuid-ossp"

  create_table "documents_categories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.uuid     "user_id"
    t.uuid     "parent_id"
    t.string   "colour"
    t.integer  "sort_index"
    t.integer  "children_categories_count", default: 0, null: false
    t.integer  "integer",                   default: 0, null: false
    t.integer  "documents_count",           default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["parent_id"], name: "index_documents_categories_on_parent_id", using: :btree
    t.index ["sort_index"], name: "index_documents_categories_on_sort_index", using: :btree
    t.index ["user_id"], name: "index_documents_categories_on_user_id", using: :btree
  end

  create_table "documents_documents", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.text     "file"
    t.uuid     "category_id"
    t.uuid     "user_id"
    t.integer  "sort_index"
    t.jsonb    "data",        default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_documents_documents_on_category_id", using: :btree
    t.index ["sort_index"], name: "index_documents_documents_on_sort_index", using: :btree
    t.index ["user_id"], name: "index_documents_documents_on_user_id", using: :btree
  end

  create_table "galleries_albums", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "public_display"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_galleries_albums_on_user_id", using: :btree
  end

  create_table "galleries_galleries", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "album_id"
    t.string   "caption"
    t.string   "file"
    t.jsonb    "data",            default: {}
    t.integer  "position"
    t.integer  "seq",             default: 0
    t.boolean  "name_processing", default: false, null: false
    t.string   "name_tmp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["album_id"], name: "index_galleries_galleries_on_album_id", using: :btree
    t.index ["user_id"], name: "index_galleries_galleries_on_user_id", using: :btree
  end

  create_table "seed_migration_data_migrations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "version"
    t.integer  "runtime"
    t.datetime "migrated_on"
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "firstname",              default: "",    null: false
    t.string   "lastname",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "system_admin",           default: false
    t.json     "data",                   default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
