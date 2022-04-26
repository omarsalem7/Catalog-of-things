require 'json'

class AuthorModule

    attr_accessor :authors
    def initialize
        @storage_file = './data/authors.json'
        file = JSON.parse(File.read(@storage_file))
        @authors = file.empty? ? [] : file
    end

    def list_all_authors
        puts 'Sorry, there are no authors available at the moment' if @authors.empty?
        file = JSON.parse(File.read(@storage_file))
        @authors = file
        puts "There are #{@authors.count} authors(s) in the system"
        @authors.each_with_index do |author, index|
           puts "#{index + 1}) ID: #{author['id']} | First name: #{author['first_name']} | Last name: #{author['last_name']}"
        end
    end

    def add_to_store(object)
        object = object.to_hash
        @authors << object unless @authors.include?(object)
        File.write(@storage_file, JSON[@authors])
    end
end