require_relative '../classes/book'
require_relative '../classes/item'

describe Book do
  context 'Tests for the book class' do
    book1 = Book.new('omar', 'good', '22-10-2000')
    book2 = Book.new('salem', 'good', '22-10-2020')

    it 'check for a book object' do
      expect(book1).to be_instance_of(Book)
    end
    it 'check for can_be_archived method' do
      expect(book1.can_be_archived?).to be(true)
      expect(book2.can_be_archived?).to be(false)
    end
    it 'check for move_to_archive method' do
      book1.move_to_archive
      book2.move_to_archive
      expect(book1.archived).to be(true)
      expect(book2.archived).to be(false)
    end
  end
end
