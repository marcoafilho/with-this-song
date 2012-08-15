# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  album      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ActiveRecord::Base
  has_many :artist_songs
  has_many :interpreters, through: :artist_songs, foreign_key: "artist_id", class_name: "Artist"
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  attr_accessible :album, :title, :interpreter_ids, :genre_ids, :rating
  
  MAX_RATING = 5
  MIN_RATING = 1
  
  validates :title, presence: true
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: MAX_RATING, greater_than_or_equal_to: MIN_RATING }
  
  self.per_page = 15
  
  def format_artists
    if interpreters.count == 0
      ""
    elsif interpreters.count > 1
      "Various Artists"
    else
      interpreters.first.name
    end
  end
end
