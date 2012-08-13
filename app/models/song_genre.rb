# == Schema Information
#
# Table name: song_genres
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
  # attr_accessible :title, :body
end
