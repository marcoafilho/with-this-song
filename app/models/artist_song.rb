class ArtistSong < ApplicationRecord
  belongs_to :interpreter, foreign_key: "artist_id", class_name: "Artist"
  belongs_to :song
end
