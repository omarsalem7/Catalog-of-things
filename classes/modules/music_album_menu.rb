module MusicAlbumMenu
  def menu(option)
    case option
    when 1
      add_album
    when 2
      list_albums
    end
  end

  def sub_menu
    puts '
            1 - Add a music album
            2 - List all music albums
            3 - Go back to the main menu'
  end

  def display_options
    puts 'Great choice! What would you like to do?'
    until sub_menu
      option = gets.chomp.to_i
      manage_music(option)
      if option == 3
        puts 'Returning to the main menu:'
        break
      end
    end
  end
end
