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

require 'spec_helper'

describe ArtistSong do
  pending "add some examples to (or delete) #{__FILE__}"
end
