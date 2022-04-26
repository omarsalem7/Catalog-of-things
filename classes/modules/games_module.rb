require_relative '../game'

class GameModule
  attr_accessor :games

    def initialize
        @games = []
    end

    def list_all_games
        puts 'Sorry, there are no games available at the moment' if @games.empty?
        puts "There are #{@games.count} game(s) in the system"
        @games.each_with_index do |game, index|
           puts "#{index + 1}) Game ID: #{game.id} | Multiplayer: \"#{game.multiplayer}\" | Last played at: #{game.last_played_at}"
        end
    end

    def create_game
        print 'Is the game multiplayer?[yes/no]: '
        multiplayer = gets.chomp.downcase
        print 'last played at[yyyy-mm-dd]: '
        last_played_at = gets.chomp
        print 'publish date[yyyy-mm-dd]: '
        publish_date = gets.chomp
        print 'Is it archived?[true/false]: '
        archived = gets.chomp.downcase

        if multiplayer.strip != '' && last_played_at.strip != ''
        game = Game.new(multiplayer, last_played_at, publish_date, archived)
        @games << game
        puts ''
        puts "Game is created successfully. The game ID is #{game.id}."
        else
        puts ''
        puts 'Please provide all necessary data required'
        end
  end
end