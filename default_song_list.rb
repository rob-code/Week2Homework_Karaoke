class DefaultSongList

def initialize()
  # This will grow into an array of hashes with more info for each song
  @default_song_list = []
end

def default_songs
  return @default_song_list = ["Stand By Me", "Honky Tonk Women", "Dancing Queen", "My Way"]
end


end