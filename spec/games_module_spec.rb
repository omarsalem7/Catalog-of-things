require_relative '../classes/modules/games_module'

describe GameModule do
    context "when list_all_games method called" do
        it "lists all the games" do
            @games = GameModule.new
            expect(@games.list_all_games)
        end
    end
end
