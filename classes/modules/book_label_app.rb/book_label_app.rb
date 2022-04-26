require_relative './ui_utils'
require_relative './book_module'
require_relative './label_module'

class BookLabelApp
  include UserInterface
  def initialize
    @labels = LabelModule.new
    @books = BookModule.new(@labels)
  end

  def menu_select
    main_menu
    selected = gets.chomp.to_i
    @labels.populate_labels
    case selected
    when 1
      @books.list_all_books
    when 2
      @labels.list_labels
    when 3
      @books.add_book
    when 4
      puts 'bye bye see you later 👋'
      exit
    else
      puts 'Invalid input try again'
    end
    menu_select
  end
end
