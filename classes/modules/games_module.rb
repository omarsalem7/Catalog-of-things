require_relative '../game'
require_relative '../author'
require_relative './author_module'
require 'json'

class GameModule
  attr_accessor :games

  def initialize
    @storage_file = './data/games.json'
    if File.exist?(@storage_file)
    file = JSON.parse(File.read(@storage_file))
    @games = file.empty? ? [] : file
    else
      @games = []
    end
  end

  def list_all_games
    puts 'Sorry, there are no games available at the moment' if @games.empty?
    puts "There are #{@games.count} game(s) in the system"
    @games.each_with_index do |game, index|
      print "#{index + 1}) Game ID: #{game['id']} | Multiplayer: #{game['multiplayer']} |"
      print " Last played at: #{game['last_played_at']}"
      puts ''
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
    print 'Author first name: '
    fname = gets.chomp.capitalize
    print 'Author last name: '
    lname = gets.chomp.capitalize

    if multiplayer.strip != '' && last_played_at.strip != ''
      game = Game.new(multiplayer, last_played_at, publish_date, archived)
      author = Author.new(fname, lname)
      game.author = (author)
      game = game.to_hash
      @games << game
      File.write(@storage_file, JSON[@games])
      storage = AuthorModule.new
      storage.add_to_store(author)
      puts ''
      puts "Game is created successfully. The game ID is #{game['id']}."
    else
      puts ''
      puts 'Please provide all necessary data required'
    end
  end
end
