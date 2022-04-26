require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
    before :all do
        @author1 = Author.new('Robert', 'Kowasaki')
        @item = Item.new('2022-02-02', true)
    end

    context "when given two arguments" do
        it "Instantiate the object" do
            expect(@author1).to be_instance_of(Author)
        end

        it "Posess all the properties given" do
            expect(@author1.first_name).to eq('Robert') 
            expect(@author1.last_name).to eql('Kowasaki') 
            expect(@author1.id) 
        end
        
        it "can call add_item method" do
            @author1.add_item(@item)
            expect(@author1.items.length).to eql(1)
        end
    end
end