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

    def list_all_persons
        $stdout.clear_screen
        puts 'No persons are available' if @books.empty?

        @persons.each do |id, name, age, classroom, parent_permission| puts 
            "Id: #{id}\n Name: #{name}\n Age: #{age}\n Type: #{classroom}\n Parent_permission: #{parent_permission}\n"
        end
        @main_menu.comeback
    end

    def create_student
        print 'Student name: '
        name = gets.chomp
        print 'Student age: '
        age = gets.chomp
        print 'Student has parent permission [Y/N]: '
        parent_permission = gets.chomp
        print 'Student classroom: '
        classroom = gets.chomp
        @persons.push(Student.new(name, age.to_i, parent_permission, classroom))
    end

    def create_teacher 
        print 'Teacher name: '
        name = gets.chomp
        print 'Teacher age: '
        age = gets.chomp
        print 'Teacher specialization: '
        specialization = gets.chomp
        @persons.push(Teacher.new(name, age.to_i, specialization))
    end

    def create_person 
        print "What do you want to create, press [1] Student or [2] Teacher"
        user_input = $stdin.getch
        create_student if user_input == '1'
        create_teacher if user_input == '2'

        puts "** Person created successfully **"
        @main_menu.comeback
    end

    def create_book
        $stdout.clear_screen
        print "Book title: "
        title = gets.chomp
        print "Book author: "
        author = gets.chomp
        @books.push(Book.new(title, author))
        puts "** Book created successfully **"
        @main_menu.comeback
    end

    def show_persons
        if @persons.empty?
            puts '** No person to rent books, please create a new person **'
            return false
        end
        puts 'Select person who\'s renting the book'
        @persons.each_with_index do |person, index|
            puts "[#{index}] - #{person.classroom} - Name: #{person.correct_name}"
        end
        $stdin.getch.to_i
    end

    def create_rental
        if @books.empty?
            puts '** No books to rent, please create a new book **'
            @main_menu.comeback
        end
        puts 'Select the book to rent: '
        @books.each_with_index { |book, index| puts "[#{index}] - Title: #{book.title} - Author: #{book.author}" }
        book_selected = $stdin.getch.to_i

        @main_menu.comeback unless (person_selected = show_persons)

        print "\n Date to return the book [MM/DD/YYYY]: "
        date_return = gets.chomp

        @rentals.push(Rental.new(date_return, @books[book_selected], @persons[person_selected]))
        puts "** Rental added successfully **"
        @main_menu.comeback
    end

    def rentals_to_person
        return unless (person_selected = showpersons)

        person_id = @persons[person_selected].id
        puts "\n Rentals for #{@persons[person_selected].correct_name}"
        @rentals.map do |rental|
            puts "#{rental.date} - Book: #{rental.book_title} by #{rental.book.author}" if rental.person.id == person_id
        end
        @main_menu.comeback
    end

    def exit_app
        exit(true)
    end
end