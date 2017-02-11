require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../guest.rb' )

class TestGuest < MiniTest::Test

  def setup()
    @guest = Guest.new("Peter", 23, 10.3, "I Will Survive")
  end

  def test_get_guest_name
    assert_equal("Peter", @guest.name)
  end

  def test_id_of_room_allocated_to_guest
    assert_equal(23, @guest.id_of_room_allocated_to_guest)
  end

  def test_get_check_in_time
    assert_equal(10.3, @guest.check_in_time)
  end

# def test_get_favourite_song_when_nil
  #  assert_equal(nil, @guest.favourite_song)
# end

  def test_get_favourite_song_when_favourite_song_exists
    assert_equal("I Will Survive", @guest.favourite_song)
  end



end

