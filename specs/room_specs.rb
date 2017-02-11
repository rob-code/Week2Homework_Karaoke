require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../room.rb' )
require_relative( '../default_song_list.rb' )


class TestRoom < MiniTest::Test

  def setup()
    @default_song_list = DefaultSongList.new
    @room1 = Room.new(12, 8, @default_song_list.default_songs)
  end

  def test_room_id
    assert_equal(12, @room1.room_id)
  end

  def test_max_people_in_room
    assert_equal(8, @room1.max_people_allowed_in_room)
  end

  def test_default_song_list
    assert_equal(["Stand By Me", "Honky Tonk Women", "Dancing Queen", "My Way"], @room1.default_song_list)
  end

  def test_default_song_list
    assert_equal(["Stand By Me", "Honky Tonk Women", "Dancing Queen", "My Way"], @room1.default_song_list)
  end

  def test_add_person_to_room
    @room1.add_person_to_room("Jo")
    @room1.add_person_to_room("Bill")
    @room1.add_person_to_room("Pete")
    assert_equal(true, @room1.names_of_guests_in_room.include?("Jo"))
  end

  def test_remove_person_to_room
    @room1.add_person_to_room("Jo")
    @room1.add_person_to_room("Bill")
    @room1.add_person_to_room("Pete")
    assert_equal(true, @room1.names_of_guests_in_room.include?("Jo"))
    @room1.remove_person_from_room("Jo")
    assert_equal(false, @room1.names_of_guests_in_room.include?("Jo"))
  end


  def test_is_room_full?
    @room1.add_person_to_room("Jo")
    @room1.add_person_to_room("Bill")
    @room1.add_person_to_room("Pete")
    @room1.add_person_to_room("Kate")
    @room1.add_person_to_room("Jane")
    @room1.add_person_to_room("Ronnie")
    @room1.add_person_to_room("Dilly")
    @room1.add_person_to_room("Karen")
    # @room1.add_person_to_room("Robert")
    assert_equal(true, @room1.is_room_full?)
  end

  def test_add_favourite_song_if_person_has_one
    @room1.add_favourite_song_if_person_has_one("bee bop aloola")
    assert_equal(true, @room1.guests_favourite_songs.include?("bee bop aloola"))
  end

  def test_remove_favourite_song_when_person_leaves
    @room1.add_favourite_song_if_person_has_one("bee bop aloola")
    @room1.add_favourite_song_if_person_has_one("bee bop aloola")    
    @room1.add_favourite_song_if_person_has_one("bee bop aloola")
    @room1.remove_favourite_song_when_person_leaves("bee bop aloola")
    assert_equal(true, @room1.guests_favourite_songs.include?("bee bop aloola"))
  end
  
  def test_get_current_combined_song_list
    @room1.add_favourite_song_if_person_has_one("Paradise")
    @room1.add_favourite_song_if_person_has_one("Jailhouse Rock")
    @room1.build_current_combined_song_list
    @room1.build_current_combined_song_list
    @room1.build_current_combined_song_list
    assert_equal(true, @room1.get_current_combined_song_list.include?("Paradise"))
    assert_equal(true, @room1.get_current_combined_song_list.include?("Jailhouse Rock"))

    assert_equal(true, @room1.get_current_combined_song_list.include?("Stand By Me"))
    puts @room1.get_current_combined_song_list
  end

end