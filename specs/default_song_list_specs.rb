require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../default_song_list.rb' )

class TestDefaultSongList < MiniTest::Test

def setup()
  @default_song_list = DefaultSongList.new()
end

def test_default_song_list
  assert_equal(["Stand By Me", "Honky Tonk Women", "Dancing Queen", "My Way"], @default_song_list.default_songs)
end

end
