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

ActiveRecord::Schema.define(version: 20160811222047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gallery_pictures", force: :cascade do |t|
    t.string   "image_thumb"
    t.string   "image_large"
    t.string   "image_alt"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "site_id"
  end

  add_index "gallery_pictures", ["site_id"], name: "index_gallery_pictures_on_site_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.string   "logo",             default: "svg/min/logo.svg"
    t.string   "hero_img",         default: "hero.jpg"
    t.string   "hero_title"
    t.string   "hero_description"
    t.string   "api_token"
    t.string   "phone"
    t.string   "emergency"
    t.string   "email"
    t.string   "address"
    t.string   "monfri_hours"
    t.string   "sat_hours"
    t.string   "sun_hours"
    t.string   "testimonials_img", default: "parallax.jpg"
    t.string   "facebook",         default: "http://facebook.com"
    t.string   "twitter",          default: "http://twitter.com"
    t.string   "instagram",        default: "http://instagram.com"
    t.string   "youtube",          default: "http://youtube.com"
    t.string   "skype"
    t.string   "pie",              default: "© 2016 - Todos los derechos reservados"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.integer  "user_id"
  end

  add_index "sites", ["user_id"], name: "index_sites_on_user_id", using: :btree

  create_table "team_members", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "site_id"
  end

  add_index "team_members", ["site_id"], name: "index_team_members_on_site_id", using: :btree

  create_table "testimonials", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "site_id"
  end

  add_index "testimonials", ["site_id"], name: "index_testimonials_on_site_id", using: :btree

  create_table "treatments", force: :cascade do |t|
    t.string   "icon"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "site_id"
  end

  add_index "treatments", ["site_id"], name: "index_treatments_on_site_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "url"
    t.string   "image"
    t.string   "first_name"
  end

end
