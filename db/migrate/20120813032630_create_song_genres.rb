class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.references :song
      t.references :genre

      t.timestamps
    end
    add_index :song_genres, :song_id
    add_index :song_genres, :genre_id
  end
end
