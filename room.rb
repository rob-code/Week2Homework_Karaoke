class Room

  attr_reader :room_id, :max_people_allowed_in_room, :default_song_list, :names_of_guests_in_room, :guests_favourite_songs, :current_combined_song_list

  def initialize(room_id, max_people_allowed_in_room, default_song_list)
    @room_id = room_id
    @max_people_allowed_in_room = max_people_allowed_in_room
    @default_song_list = default_song_list
    @names_of_guests_in_room = []
    @guests_favourite_songs = []
    @current_combined_song_list = []
    @number_of_guests_in_room = 0
  end

  def add_person_to_room(name)
    if !is_room_full?
        @names_of_guests_in_room.push(name)        
    else     
        puts "Room #{@room_id} is currently occupied by #{@max_people_allowed_in_room} guests and is full. Please try booking the guest into another room or try again later.\n"
        puts "The guests currently in Room #{@room_id} are:"
        self.names_of_guests_in_room.each {|guest| puts guest}
    end
  end

  def remove_person_from_room(name)
    @names_of_guests_in_room.delete(name)
  end

  def is_room_full?
    @names_of_guests_in_room.count >= @max_people_allowed_in_room ? true : false
  end

  def add_favourite_song_if_person_has_one(name)
    @guests_favourite_songs.push(name)
  end

  def remove_favourite_song_when_person_leaves(name)
    # dont want to delete all entries of a song, just one
    # guests in the room might share the same fave song
    @guests_favourite_songs.slice!((@guests_favourite_songs.index(name)))
  end

  def build_current_combined_song_list
    # Dont use concat as it adds the faves to the default song list!
    # so each time we run this we add duplicates of guests faves
    @current_combined_song_list = @default_song_list + @guests_favourite_songs
  end

  def get_current_combined_song_list
    @current_combined_song_list
  end



end