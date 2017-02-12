class Runner

  def initialize(guests_in_reception, bar_manager)
    @guests_in_reception = guests_in_reception
    @bar_manager = bar_manager
  end

  def check_in_guests_in_reception
    @guests_in_reception.each do |guest| 
      @bar_manager.check_guest_into_room(guest)
      @bar_manager.add_favourite_song_to_room(guest)
    end
  end

  def print_karaoke_bar_dashboard
    puts ""
    puts "***************** HokeKoKe Karaoke Bar Dashboard *********************"
    puts ""

    puts "Number of Rooms Available : #{@bar_manager.number_of_rooms_in_bar}"
    puts ""
    
    @bar_manager.rooms_available.each do |room|
      puts "Room #{room.room_id}=>  Room capacity: #{room.max_people_allowed_in_room},  Number of guests in room: #{room.get_number_of_guests_in_room}"
    end

    puts""
    puts "Occupants' Names:"
    
    @bar_manager.rooms_available.each do |room|
      puts "Room #{room.room_id}=>  Names: #{room.names_of_guests_in_room.join(", ") }"
    end

    puts""
    puts "Room Songlists:"
    @bar_manager.rooms_available.each do |room|
      puts "Room #{room.room_id}=>  #{room.current_combined_song_list.join(", ") }"
    end
    puts ""
    puts ""
    puts ""
  end

  def book_in_new_guest(guest)
    puts "Lets now check #{guest.name} into Room #{guest.id_of_room_allocated_to_guest}. #{guest.name}'s favourite song is #{guest.favourite_song}."
    @bar_manager.check_guest_into_room(guest)
    @bar_manager.add_favourite_song_to_room(guest)
  end

def check_out_guest(guest)
  puts "Lets now check #{guest.name} out of Room #{guest.id_of_room_allocated_to_guest}. #{guest.name}'s favourite song is #{guest.favourite_song}."
  @bar_manager.check_guest_out_of_room(guest)
  @bar_manager.remove_favourite_song_when_guest_leaves(guest)

end




end