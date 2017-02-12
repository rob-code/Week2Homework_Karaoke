require( 'minitest/autorun' )
require( 'minitest/rg' )
#require_relative( '../song.rb' )
require_relative( '../room.rb' )
require_relative( '../guest.rb' )
require_relative('../default_song_list.rb')
require_relative('../bar_manager.rb')
require_relative('../runner.rb')

class TestBarManager < MiniTest::Test

def setup()

  @default_song_list = DefaultSongList.new

  @room1 = Room.new(1, 5, @default_song_list.default_songs)
  @room2 = Room.new(2, 5, @default_song_list.default_songs)
  @room3 = Room.new(3, 5, @default_song_list.default_songs)
  @room4 = Room.new(4, 5, @default_song_list.default_songs)
  @guest1 = Guest.new("George", 1, 5, "Here Comes The Sun")
  @guest2 = Guest.new("Paul", 2, 5, "Hey Jude")
  @guest3 = Guest.new("John", 3, 5, "Imagine")
  @guest4 = Guest.new("Ringo", 4, 5, "Back in the USSR")
  @guest5 = Guest.new("Bert", 4, 5, "Saturday Night Fever")
  @guest6 = Guest.new("Ritchie", 3, 5, "Smoke on the Water")

  rooms_available = [@room1, @room2, @room3, @room4]
  guests_in_reception = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]

  @bar_manager = BarManager.new(rooms_available)

  @runner = Runner.new(guests_in_reception, @bar_manager)
end

def test_check_in_guests_in_reception
  @runner.check_in_guests_in_reception
  assert_equal(4, @bar_manager.number_of_rooms_in_bar)
  assert_equal(["George"], @room1.names_of_guests_in_room)
  assert_equal(["Paul"], @room2.names_of_guests_in_room)
  assert_equal(["John", "Ritchie"], @room3.names_of_guests_in_room)
  assert_equal(["Ringo", "Bert"], @room4.names_of_guests_in_room)
end

# def test_print_karaoke_bar_dashboard
#   @runner.check_in_guests_in_reception
#   @runner.print_karaoke_bar_dashboard
# end

# def test_book_in_new_guest
#   @runner.check_in_guests_in_reception
#   @guest7 = Guest.new("Gloria", 2, 5, "I Will Survive")
#   @runner.book_in_new_guest(@guest7)
#   @runner.print_karaoke_bar_dashboard
# end

def test_check_out_guest
  @runner.check_in_guests_in_reception
  puts "Here's the starting dashboard populated by runner_specs.rb:"
  @runner.print_karaoke_bar_dashboard
  @guest7 = Guest.new("Gloria", 3, 5, "I Will Survive")
  @runner.book_in_new_guest(@guest7)
  @guest8 = Guest.new("Elvis", 2, 5, "Jailhouse Rock")
  @runner.book_in_new_guest(@guest8)
  @guest9 = Guest.new("Slash", 4, 5, "Sweet Child Of Mine")
  @runner.book_in_new_guest(@guest9)
  @guest10 = Guest.new("Jimmy", 2, 5, "Whole Lotta Love")
  @runner.book_in_new_guest(@guest10)
 @guest11 = Guest.new("Whitney", 2, 5, "The Greatest Love")
 @runner.book_in_new_guest(@guest11)
 @guest12 = Guest.new("Dusty", 2, 5, "Son of a Preacher Man")
 @runner.book_in_new_guest(@guest12)
 @guest13 = Guest.new("Adele", 2, 5, "Hello")
 @runner.book_in_new_guest(@guest13)
  @runner.print_karaoke_bar_dashboard

  @runner.check_out_guest(@guest4)
  @runner.check_out_guest(@guest11)
  @runner.check_out_guest(@guest8)
  @runner.print_karaoke_bar_dashboard



end

end
