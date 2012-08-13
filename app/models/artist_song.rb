# == Schema Information
#
# Table name: artist_songs
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  song_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtistSong < ActiveRecord::Base
  belongs_to :interpreter, foreign_key: "artist_id", class_name: "Artist"
  belongs_to :song
  # attr_accessible :title, :body
end
