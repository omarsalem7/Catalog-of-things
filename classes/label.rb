class Label
  attr_reader :items, :id
  attr_accessor :title, :color

  def initialize(title, color)
    @id = rand(0..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
