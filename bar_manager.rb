class BarManager

  def initialize(rooms_available)
    @rooms_available = rooms_available
    @number_of_rooms_in_bar = @rooms_available.length
    @session_length = 60
    @room = nil
  end

def check_guest_into_room(guest)
    @rooms_available[guest.id_of_room_allocated_to_guest-1].add_person_to_room(guest.name)
end

def check_guest_out_of_room(guest)
    @rooms_available[guest.id_of_room_allocated_to_guest-1].remove_person_from_room(guest.name)
end

def add_favourite_song_to_room(guest)
  @rooms_available[guest.id_of_room_allocated_to_guest-1].add_favourite_song_if_person_has_one(guest.favourite_song)
  @rooms_available[guest.id_of_room_allocated_to_guest-1].build_current_combined_song_list
end

def remove_favourite_song_when_guest_leaves(guest)
  @rooms_available[guest.id_of_room_allocated_to_guest-1].remove_favourite_song_when_person_leaves(guest.favourite_song)
  @rooms_available[guest.id_of_room_allocated_to_guest-1].build_current_combined_song_list
end

def get_current_song_list_for_room(room)
  @rooms_available[room-1].get_current_combined_song_list
end


end
