require_relative '../../label'
class LabelModule
  attr_accessor :labels

  def initialize
    @labels = []
  end

  def populate_labels
    file = File.read('./data/labels.json')
    labels = JSON.parse(file, { symbolize_names: true })
    return unless @labels.empty?

    labels.each do |label|
      @labels.push(Label.new(label[:title], label[:color]))
    end
  end

  def list_labels
    @labels.each_with_index do |label, index|
      puts "#{index + 1}) title: #{label.title}, color: #{label.color}"
    end
  end
end
