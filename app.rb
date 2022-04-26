require './classes/modules/games_module.rb'
require './classes/modules/author_module.rb'


class App
    def initialize
        @games = GameModule.new
        @authors = AuthorModule.new
    end

    def user_interface
        puts ''
        puts " Please choose among the options below by pressing its corresponding number:
                1.List all games
                2.List all authors
                3.Add a game
                4.Exit"
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
            puts 'Thank you for using the app!'
            exit
        else
            puts 'Invalid input. Please try again'
        end
        options
    end
end

