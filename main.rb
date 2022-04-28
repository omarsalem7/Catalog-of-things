# main file for programe
require './app'
require_relative './classes/modules/book_label_module/book_label_app'
puts 'Welcome to the Catalog of things app'

def main
  app = App.new
  app.options
end

main
