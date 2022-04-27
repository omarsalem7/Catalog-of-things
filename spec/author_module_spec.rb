require_relative '../classes/modules/author_module'

describe AuthorModule do
  context 'when list_all_authors method called' do
    it 'lists all the games' do
      @authors = AuthorModule.new
      expect(@authors.list_all_authors)
    end
  end
end
