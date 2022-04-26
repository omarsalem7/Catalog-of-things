require_relative '../../book'

class BookModule
  attr_accessor :books

  def initialize(params)
    @books = params[:books]
    @labels = params[:labels]
  end

  def add_book
    my_labels = @labels.labels
    print 'Enter Publisher: '
    publisher = gets.chomp
    print 'Enter cover state good (y) or bad (n): '
    state = gets.chomp
    state_result = 'good'
    case state
    when 'y' then state_result = 'good'
    when 'n' then state_result = 'bad'
    end
    print 'Enter Publish date(yyyy-mm-dd): '
    date = gets.chomp
    book = Book.new(publisher, state_result, date)
    puts 'Select which label the book should have:'
    @labels.list_labels
    label_index = gets.chomp.to_i
    book.label = my_labels[label_index-1]
    @books << book
    puts 'The book added successfully 😊'
  end

  def list_all_books
    puts 'no books exits, Add one' if @books.empty?
    @books.each_with_index do |book, index|
      puts ' '
      print "Book(#{index}) => Publisher: #{book.publisher} | label: #{book.label.title} | "
      print "cover state: #{book.cover_state} | publish date: #{book.publish_date} "
    end
  end
end
