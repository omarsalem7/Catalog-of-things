require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  context 'Tests for the book class' do
    label1 = Label.new('omar', 'red')
    item = Item.new('22-10-2022', true)

    it 'check for a label object' do
      expect(label1).to be_instance_of(Label)
    end
    it 'check for add_item method' do
      label1.add_item(item)
      p item.label
      expect(label1.items.length).to eq(1)
    end
    it 'add more arguments' do
      expect { Label.new('t', 's', 'a') }.to raise_error(ArgumentError)
    end
  end
end
