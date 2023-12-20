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

ActiveRecord::Schema[7.1].define(version: 2023_12_20_183228) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "manga_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_bookmarks_on_list_id"
    t.index ["manga_id"], name: "index_bookmarks_on_manga_id"
  end

  create_table "chapitres", force: :cascade do |t|
    t.string "titre"
    t.integer "numero_chapitre"
    t.bigint "manga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_chapitres_on_manga_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chapitre_id", null: false
    t.text "commentaire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "lu"
    t.index ["chapitre_id"], name: "index_lectures_on_chapitre_id"
    t.index ["user_id"], name: "index_lectures_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "nom"
    t.string "couverture"
    t.string "auteur"
    t.string "statut"
    t.float "note_moyenne"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "synopsys"
    t.integer "volume"
    t.integer "chapitre"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "lists"
  add_foreign_key "bookmarks", "mangas"
  add_foreign_key "chapitres", "mangas"
  add_foreign_key "lectures", "chapitres"
  add_foreign_key "lectures", "users"
  add_foreign_key "lists", "users"
end
