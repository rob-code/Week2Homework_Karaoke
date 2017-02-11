require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../song.rb' )

class TestSong < MiniTest::Test

def setup()

@song = Song.new("Shang A Lang")

end


def test_title
  assert_equal("Shang A Lang", @song.title)
end



end

