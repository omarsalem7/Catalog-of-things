module UserInterface
  def main_menu
    puts ' '
    puts 'Please choose an option by entering a number:
            1 - List all books
            2 - List all labels
            3 - Add a book
            4 - Exit'
    puts ' '
  end

  def good_bad_selection(state)
    state_result = 'good'
    case state
    when 'y' then state_result = 'good'
    when 'n' then state_result = 'bad'
    end
    state_result
  end
end
