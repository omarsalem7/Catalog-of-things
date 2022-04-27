require_relative '../genre'

class GenreModule
  attr_accessor :genre

  def initialize
    @genre = []
  end

  def create_genre
    puts 'Enter the music genre'
    name = gets.chomp
    new_genre = Genre.new(name)
    @genre << new_genre
    puts ''
    puts 'Music genre created successfully.'
  end

  def list_all_genres
    @genre.each_with_index do |genre, index|
      puts "(#{index + 1}) ID: #{genre.id} - Genre Name: #{genre.name}"
    end
  end
end
