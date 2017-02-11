require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../song.rb' )
require_relative( '../room.rb' )
require_relative( '../guest.rb' )
require_relative('../default_song_list.rb')
require_relative('../bar_manager.rb')

class TestBarManager < MiniTest::Test

def setup()

@default_song_list = DefaultSongList.new

@room1 = Room.new(1, 8, @default_song_list.default_songs)
@room2 = Room.new(2, 8, @default_song_list.default_songs)
@room3 = Room.new(3, 8, @default_song_list.default_songs)
@room4 = Room.new(4, 8, @default_song_list.default_songs)
@guest1 = Guest.new("George", 1, 5, "Here Comes The Sun")
@guest2 = Guest.new("Paul", 1, 5, "Hey Jude")
@guest3 = Guest.new("John", 1, 5, "Imagine")
@guest4 = Guest.new("Ringo", 1, 5, "Back in the USSR")

rooms_available = [@room1, @room2, @room3, @room4]
guests_in_bar = [@guest1, @guest2, @guest3, @guest4]

@bar_manager = BarManager.new(rooms_available)
end

def test_check_guest_into_room
  @bar_manager.check_guest_into_room(@guest1)
  @bar_manager.check_guest_into_room(@guest2)
  assert_equal(["George", "Paul"], @room1.names_of_guests_in_room)
end

def test_check_guest_out_of_room
  @bar_manager.check_guest_into_room(@guest1)
  @bar_manager.check_guest_into_room(@guest2)
  assert_equal(["George", "Paul"], @room1.names_of_guests_in_room)
  @bar_manager.check_guest_out_of_room(@guest1)
  assert_equal(["Paul"], @room1.names_of_guests_in_room)
end

def test_add_favourite_song_to_room
  @bar_manager.add_favourite_song_to_room(@guest1)
  assert_equal(["Here Comes The Sun"], @room1.guests_favourite_songs)
end

def test_remove_favourite_song_when_guest_leaves
  @bar_manager.add_favourite_song_to_room(@guest1)
  assert_equal(["Here Comes The Sun"], @room1.guests_favourite_songs)
  @bar_manager.remove_favourite_song_when_guest_leaves(@guest1)
  assert_equal([], @room1.guests_favourite_songs)
end

def test_get_current_song_list_for_room
  @bar_manager.add_favourite_song_to_room(@guest1)
  @bar_manager.add_favourite_song_to_room(@guest2)
  @bar_manager.add_favourite_song_to_room(@guest3)
  @bar_manager.add_favourite_song_to_room(@guest4)
  assert_equal([
    "Stand By Me", 
    "Honky Tonk Women",
    "Dancing Queen",
    "My Way",
    "Here Comes The Sun",
    "Hey Jude", 
    "Imagine",
    "Back in the USSR"], 
    @bar_manager.get_current_song_list_for_room(1))
end

end