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

require 'spec_helper'

describe SongGenre do
  pending "add some examples to (or delete) #{__FILE__}"
end
