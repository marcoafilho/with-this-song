module SongsHelper
  def artist_list(artists)
    artists.collect{ |a| [a.name, a.id] }
  end
end
