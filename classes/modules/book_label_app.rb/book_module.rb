require_relative '../../book'
require 'json'
require_relative './ui_utils'

class BookModule
  attr_accessor :books

  include UserInterface
  def initialize(labels)
    file = File.read('./books.json')
    @books = JSON.parse(file, { symbolize_names: true })
    @labels = labels
  end

  def add_book
    print 'Enter Publisher: '
    publisher = gets.chomp
    print 'Enter cover state good (y) or bad (n): '
    state = gets.chomp
    state_result = good_bad_selection(state)
    print 'Enter Publish date(yyyy-mm-dd): '
    date = gets.chomp
    puts 'Select which label the book should have:'
    @labels.list_labels
    label_index = gets.chomp.to_i
    book = Book.new(publisher, state_result, date)
    book.label = @labels.labels[label_index - 1]
    new_book = { publisher: publisher, cover_state: state_result, publish_date: date,
                 label: book.label.title }
    @books << new_book
    File.write('./books.json', JSON.dump(@books))
    puts 'The book added successfully 😊'
  end

  def list_all_books
    puts 'no books exits, Add one' if @books.empty?
    @books.each_with_index do |book, index|
      puts ' '
      print "Book(#{index + 1}) => Publisher: #{book[:publisher]} | label: #{book[:label]} | "
      print "cover state: #{book[:cover_state]} | publish date: #{book[:publish_date]} "
    end
  end
end
