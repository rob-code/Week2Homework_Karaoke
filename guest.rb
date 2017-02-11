class Guest

attr_reader :name, :id_of_room_allocated_to_guest, :check_in_time, :favourite_song

  def initialize(name, id_of_room_allocated_to_guest, check_in_time, favourite_song=nil)
    @name = name
    @id_of_room_allocated_to_guest = id_of_room_allocated_to_guest
    @check_in_time = check_in_time
    @favourite_song = favourite_song
  end






end