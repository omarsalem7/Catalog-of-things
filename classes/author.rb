class Author
   attr_accessor :first_name, :last_name
   attr_reader :items

    def initialize(first_name, last_name)
        id = rand(0..1000)
        @first_name = first_name
        @last_name = last_name
        @items = []
    end

    def add_item(item)
        @items.push(item)
        item.author = self
    end
end