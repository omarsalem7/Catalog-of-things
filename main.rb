require_relative './classes/modules/book_label_app.rb/book_label_app'
def main
  app1 = BookLabelApp.new
  app1.menu_select
end

main
