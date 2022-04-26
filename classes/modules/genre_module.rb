require_relative '../genre'

class GenreModule
    attr_accessor :genre


    def initialize
        @genre = []
    end
    
    def list_all_genres
        put 'database is empty! Add a music genre.' if @genre.empty?
        @genre.each_with_index { |genre, index| 
        puts "(#{index}) ID: #{genre.id} - Genre Name: #{genre.name}"}
    end

    def create_genre
        puts 'Enter the music genre'
        name = gets.chomp
        new_genre = Genre.new(name)
        @genre << new_genre
        puts ''
        puts 'Music genre created successfully.'
    end
end