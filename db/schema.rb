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

ActiveRecord::Schema.define(version: 2018_08_24_131838) do

  create_table "follows", force: :cascade do |t|
    t.integer "id_follower"
    t.integer "id_followed"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "id_auteur"
    t.integer "id_destinataire"
    t.text "contenu"
    t.datetime "date"
  end

  create_table "publications", force: :cascade do |t|
    t.integer "auteur_id"
    t.string "auteur"
    t.string "titre"
    t.text "contenu"
    t.datetime "date"
    t.integer "likes"
    t.index ["auteur_id"], name: "index_publications_on_auteur_id"
  end

  create_table "tchats", force: :cascade do |t|
    t.integer "auteur_id"
    t.string "auteur"
    t.string "contenu"
    t.index ["auteur_id"], name: "index_tchats_on_auteur_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "prenom", default: "", null: false
    t.string "nom", default: "", null: false
    t.string "biographie", default: "Aucune biographie.", null: false
    t.integer "id_clan", default: 0, null: false
    t.integer "rang", default: 0, null: false
    t.integer "xp", default: 30, null: false
    t.string "lienAvatar", default: "http://donatered-asset.s3.amazonaws.com/assets/default/default_user-884fcb1a70325256218e78500533affb.jpg", null: false
    t.integer "tab_id_abonnement", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["biographie"], name: "index_users_on_biographie"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id_clan"], name: "index_users_on_id_clan"
    t.index ["lienAvatar"], name: "index_users_on_lienAvatar"
    t.index ["nom"], name: "index_users_on_nom"
    t.index ["prenom"], name: "index_users_on_prenom"
    t.index ["rang"], name: "index_users_on_rang"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tab_id_abonnement"], name: "index_users_on_tab_id_abonnement"
    t.index ["username"], name: "index_users_on_username", unique: true
    t.index ["xp"], name: "index_users_on_xp"
  end

end
