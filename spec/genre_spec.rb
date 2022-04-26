require_relative '../classes/genre'

describe Genre do
  context 'Test for the Genre class' do
    before(:each) do
      @genre = Genre.new('Thriller')
      @item = Item.new('2020/11/10', false)
    end

    it 'checks for the instance of Genre' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'should check the name of the Genre' do
      expect(@genre.name).to eql('Thriller')
    end

    it 'checks for a list of items' do
      expect(@genre.items).to be_an_instance_of Array
    end
  end
end
