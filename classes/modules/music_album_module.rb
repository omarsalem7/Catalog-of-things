require_relative '../music_album'
require_relative 'music_album_menu'

class MusicAlbumModule
  include MusicAlbumMenu

  attr_accessor :music_album
  attr_reader :genre_module

  def initialize
    @music_album = []
    @genre_module = genre_module
  end

  def list_music_album
    puts 'Album database is empty. Add a new music album' if @music_album.empty?
    @music_album.each_with_index do |music_album, index|
      puts "(#{index}) publish Date: #{music_album.publish_date},
        Archived: #{music_album.achived}, On Spotify: #{music_album.on_spotify},
        Genre: #{music_album.genre}"
    end
  end

  def add_music_album
    puts 'Enter the date music was published in (YYY-MM-DD)'
    publish_date = gets.chomp

    puts 'Is it on spotify? (Y/N)'
    on_spotify = gets.chomp.downcase != 'y'
    puts 'Is it archived? (Y/N)'
    archived = gets.chomp.downcase != 'y'

    album = MusicAlbum.new(publish_date, archived, on_spotify)
    puts 'Select music gnere'
    @genre.list_all_genres
    genre_index = gets.chomp.to_i
    
    album.genre = all_genres[genre_index]
    @music_album << album

    puts 'Music album is successfully added to catalog'
  end
end