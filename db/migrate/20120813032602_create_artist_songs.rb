class CreateArtistSongs < ActiveRecord::Migration
  def change
    create_table :artist_songs do |t|
      t.references :artist
      t.references :song

      t.timestamps
    end
    add_index :artist_songs, :artist_id
    add_index :artist_songs, :song_id
  end
end
