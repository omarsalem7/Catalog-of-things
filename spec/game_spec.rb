require_relative '../classes/game'
require 'date'

describe Game do
    before :all do
        @game1 = Game.new('yes', '2022-02-02', '2010-02-02', true)
    end

    context "when given four arguments" do
        it "Instantiate the object" do
            expect(@game1).to be_instance_of(Game)
        end

        it "Posess all the properties given" do
            expect(@game1.multiplayer).to eq('yes') 
            expect(@game1.last_played_at).to eql(Date.parse('2022-02-02')) 
            expect(@game1.archived).to be true 
        end
        
        it "can call the can_archived?" do
            expect(@game1.can_be_archived?).to be false
        end
    end
end