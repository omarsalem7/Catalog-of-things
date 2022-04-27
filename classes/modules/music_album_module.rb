require_relative '../music_album'
require_relative 'music_album_menu'

class MusicAlbumModule

  attr_accessor :music_album
  attr_reader :genre_module

  def initialize(genre)
    @music_album = []
    @genre = genre
  end

  def list_music_album
    data=load_data
    puts 'Album database is empty. Add a new music album' if @music_album.empty?
    data.each_with_index do |music_album, index|
      puts "(#{index}) publish Date: #{music_album[:publish_date]},
        Archived: #{music_album[:archived]}, On Spotify: #{music_album[:on_spotify]},
        Genre name: #{music_album[:name]} "
    end
  end

  def add_music_album
    puts 'Enter the date music was published in (YYY-MM-DD)'
    publish_date = gets.chomp

    puts 'Is it on spotify? (Y/N)'
    on_spotify = gets.chomp.downcase == 'y'
    puts 'Is it archived? (Y/N)'
    archived = gets.chomp.downcase == 'y'

    album = MusicAlbum.new(publish_date, archived, on_spotify)

      puts 'Select music gnere'
      @genre.list_all_genres
      genre_index = gets.chomp.to_i
      p "@genre.genres[genre_index - 1] : #{@genre.genres[genre_index - 1]}"
      album.genre = @genre.genres[genre_index - 1]

      p "album.genre: #{album.genre}"
    new_album = { publish_date: publish_date, archived: archived, on_spotify: on_spotify,
      name: album.genre.name }
    @music_album << album
    data= load_data
    data.push(new_album)
    File.write('./music.json', JSON.dump(data))
    puts 'Music album is successfully added to catalog'
  end
  private 
  def load_data
    file = File.read('./books.json')
    data_hash = JSON.parse(file, { symbolize_names: true })
  end
end
