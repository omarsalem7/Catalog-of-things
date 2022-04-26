require_relative './ui_utils.rb'

class BookLabelApp
    include UserInterface

    def initialize

    end

    def menu_select
        main_menu
        selected = gets.chomp.to_i
        case selected
            when 1 
                # List all books
            when 2
                # List all labels
            when 3
                # Add a book
            when 4
                puts 'bye bye see you later 👋'
                exit
            else
                puts "Invalid input try again"
            end
            menu_select
    end
end