require_relative '../genre'

class GenreModule
  attr_accessor :genres

  def initialize
    @genres = []
  end

  def populate_genres
    file = File.read('./data/genre.json')
    genres = JSON.parse(file, { symbolize_names: true })
    return unless @genres.empty?

    genres.each do |genre|
      @genres.push(Genre.new(genre[:name]))
    end
  end

  def list_all_genres
    @genres.each_with_index do |genre, index|
      puts "(#{index + 1})  Genre Name: #{genre.name}"
    end
  end
end
