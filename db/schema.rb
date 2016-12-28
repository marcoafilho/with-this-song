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

ActiveRecord::Schema.define(version: 20120815002705) do

  create_table "artist_songs", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["artist_id"], name: "index_artist_songs_on_artist_id"
    t.index ["song_id"], name: "index_artist_songs_on_song_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_artists_on_name", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "song_genres", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["genre_id"], name: "index_song_genres_on_genre_id"
    t.index ["song_id"], name: "index_song_genres_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "album"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
  end

end
