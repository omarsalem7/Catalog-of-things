require_relative '../genre'

class GenreModule
  attr_accessor :genres

  def initialize
    file = File.read('./genre.json')
    @genres = JSON.parse(file, { symbolize_names: true }) 
  end

  # def populate_genres
  #   file = File.read('./genre.json')
  #   genres = JSON.parse(file, { symbolize_names: true })
  #   return unless @genres.empty?
  #   genres.each do |genre|
  #     @genres.push(Genre.new(genre[:name]))
  #   end
  # end

  def create_genre
    puts 'Enter the music genre'
    name = gets.chomp
    new_genre = Genre.new(name)
    our_new_genre = { name: name }
    @genres << our_new_genre
    File.write('./genre.json', JSON.dump(@genres))
    puts ''
    puts 'Music genre created successfully.'
  end

  def list_all_genres
    @genres.each_with_index do |genre, index|
      puts "(#{index + 1})  Genre Name: #{genre[:name]}"
    end
  end
end
