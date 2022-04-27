module UserInterface
  def good_bad_selection(state)
    state_result = 'good'
    case state
    when 'y' then state_result = 'good'
    when 'n' then state_result = 'bad'
    end
    state_result
  end
end
