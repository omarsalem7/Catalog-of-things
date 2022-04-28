require_relative '../music_album'

class MusicAlbumModule
  attr_accessor :music_album
  attr_reader :genre_module

  def initialize(genre)
    if File.exist?('./data/music_album.json')
    file = File.read('./data/music_album.json')
    @music_album = JSON.parse(file, { symbolize_names: true })
    else
      @music_album = []
    end
    @genre = genre
  end

  def list_music_album
    puts 'Album database is empty. Add a new music album' if @music_album.empty?
    @music_album.each_with_index do |music_album, index|
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
    album.genre = @genre.genres[genre_index - 1]
    new_album = { publish_date: publish_date, archived: archived, on_spotify: on_spotify,
                  name: album.genre.name }
    @music_album << new_album
    File.write('./data/music_album.json', JSON.dump(@music_album))
    puts 'Music album is successfully added to catalog'
  end
end
