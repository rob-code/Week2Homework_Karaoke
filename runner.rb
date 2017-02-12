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

    puts "***************** Robert's Karaoke Bar : Dashboard *********************"
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




  end






end