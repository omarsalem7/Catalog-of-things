# main file for programe
require './app'

def main
  puts 'Welcome to the Catalog of things app'
  app = App.new
  app.options
end

main
