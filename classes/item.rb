require 'date'
class Item
  attr_reader :label

  def initialize(publish_date, label, archived)
    @id = Random.rand(1..1000)
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.animals.include?(self)
  end

  def can_be_archived?
    Time.now.year - @publish_date.year > 10
  end
end
