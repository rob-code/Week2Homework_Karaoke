class Room

  attr_reader :room_id, :max_people_allowed_in_room, :default_song_list, :names_of_guests_in_room

  def initialize(room_id, max_people_allowed_in_room, default_song_list)
    @room_id = room_id
    @max_people_allowed_in_room = max_people_allowed_in_room
    @default_song_list = default_song_list
    @names_of_guests_in_room = []
    @guests_favourite_songs = []
    @number_of_guests_in_room = 0
  end

def add_person_to_room(name)
    @names_of_guests_in_room.push(name)
end

def remove_person_from_room(name)
    @names_of_guests_in_room.delete(name)
end

def is_room_full?
    @names_of_guests_in_room.count >= @max_people_allowed_in_room ? true : false
end

# def add_favourite_song_if_person_has_one
# end

# def remove_favourite_song_when_person_leaves
# end

end