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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_01_03_094431) do
=======
ActiveRecord::Schema.define(version: 2022_01_14_134356) do
>>>>>>> cf5b4d7 (feat: create new CreateArticle and CreateComments services for add new article with comments in db, also delete @page and @comments variables from show method in article controller, move all logic from create method in article controller to services)
=======
ActiveRecord::Schema.define(version: 2022_01_14_134356) do
>>>>>>> add_saving_all_dates_in_database

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
  end

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> add_saving_all_dates_in_database
  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "article_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  add_foreign_key "comments", "articles"
<<<<<<< HEAD
>>>>>>> cf5b4d7 (feat: create new CreateArticle and CreateComments services for add new article with comments in db, also delete @page and @comments variables from show method in article controller, move all logic from create method in article controller to services)
=======
>>>>>>> add_saving_all_dates_in_database
end
