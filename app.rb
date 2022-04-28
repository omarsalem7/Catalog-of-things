require './classes/modules/games_module'
require './classes/modules/genre_module'
require './classes/modules/music_album_module'
require './classes/modules/author_module'
require_relative './classes/modules/book_label_module/book_module'
require_relative './classes/modules/book_label_module/label_module'

class App
  attr_accessor :genre

  def initialize
    @games = GameModule.new
    @genre = GenreModule.new
    @music_album = MusicAlbumModule.new(@genre)
    @authors = AuthorModule.new
    @labels = LabelModule.new
    @books = BookModule.new(@labels)
  end

  def user_interface
    puts ' '
    puts " Please choose among the options below by pressing its corresponding number:
                1.List all books
                2.List all labels
                3.Add a book
                4.List all games
                5.List all authors
                6.Add a game
                7.List all genres
                8.List all music
                9.Add music album
                10.Exit"
    puts ' '
  end

  def options
    user_interface
    selection = gets.chomp
    hash_options = { '1' => -> { @books.list_all_books }, '2' => -> { @labels.list_labels }, '3' => lambda {
      @books.add_book
    } }

    hash_options2 = { '4' => -> { @games.list_all_games }, '5' => -> { @authors.list_all_authors }, '6' => lambda {
      @games.create_game
    } }

    hash_options3 = { '7' => -> { @genre.list_all_genres }, '8' => lambda {
      @music_album.list_music_album
    } }

    hash_options4 = { '9' => -> { @music_album.add_music_album }, '10' => -> { exit } }

    hash_options = hash_options.merge(hash_options2, hash_options3, hash_options4)

    if hash_options.key?(selection)
      @genre.populate_genres
      @labels.populate_labels
      hash_options[selection].call
    else
      puts 'Invalid input. Please try again'
    end

    options
  end
end
