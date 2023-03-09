require_relative 'books'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
    def initialize main_menu
        @main_menu = main_menu
        @books = []
        @persons = []
        @rentals = []
    end

    def list_all_books
        puts 'Library is empty' if @books.empty?
        @books.each { |title, author| puts "Book: #{title} - Author: #{author}" }
        @main_menu.comeback
    end


end