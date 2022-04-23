require 'date'
class Item
  attr_reader :id, :archived, :label

  attr_access :publish_date

  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @label = nil
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    Time.now.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
