require './classes/modules/games_module'
require './classes/modules/genre_module'
require './classes/modules/music_album_module'
require './classes/modules/author_module'

class App
  attr_accessor :genre

  def initialize
    @games = GameModule.new
    @genre = GenreModule.new
    @music_album = MusicAlbumModule.new(@genre)
    @authors = AuthorModule.new
  end

  def user_interface
    puts ''
    puts " Please choose among the options below by pressing its corresponding number:
                1.List all games
                2.List all authors
                3.Add a game
                4.List all genres
                5.Add genre
                6.List all music
                7.Add music album
                8.Exit"
  end

  def options
    user_interface
    selection = gets.chomp
    case selection
    when '1'
      @games.list_all_games
    when '2'
      @authors.list_all_authors
    when '3'
      @games.create_game
    when '4'
      @genre.list_all_genres
    when '5'
      @genre.create_genre
    when '6'
      @music_album.list_music_album
    when '7'
      @music_album.add_music_album
    when '8'
      puts 'Thank you for using the app!'
      exit
    else
      puts 'Invalid input. Please try again'
    end
    options
  end
end
