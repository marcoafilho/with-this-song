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

ActiveRecord::Schema.define(:version => 20120815002705) do

  create_table "artist_songs", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "song_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "artist_songs", ["artist_id"], :name => "index_artist_songs_on_artist_id"
  add_index "artist_songs", ["song_id"], :name => "index_artist_songs_on_song_id"

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "artists", ["name"], :name => "index_artists_on_name", :unique => true

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "genres", ["name"], :name => "index_genres_on_name", :unique => true

  create_table "song_genres", :force => true do |t|
    t.integer  "song_id"
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "song_genres", ["genre_id"], :name => "index_song_genres_on_genre_id"
  add_index "song_genres", ["song_id"], :name => "index_song_genres_on_song_id"

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.string   "album"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "rating"
  end

end
