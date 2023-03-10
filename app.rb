require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'


def list_all_books(books)
  if books[0]
  books.each { |title, author| puts "Book: #{title} - Author: #{author}" }
  else
    puts 'Library is empty'
  end
end

def list_all_persons(persons)
  if persons[0]
    @persons.each { |person| puts "[#{person.classroom}] Id: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  else
    puts 'No persons included so far, please add a person'
  end
end

def create_person(person)
  print 'What do you want to create, press [1] for Student or [2] for Teacher'
  choice = gets.chomp.to_i
  create_student if choice == '1'
  create_teacher if choice == '2'

  puts '** Person created successfully **'
end

def create_student
  print 'Student name: '
  name = gets.chomp
  print 'Student age: '
  age = gets.chomp.to_i
  print 'Student has parent permission [Y/N]: '
  parent_permission = gets.chomp.to_s.downcase
  print 'Student classroom: '
  classroom = gets.chomp
  persons.push(Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom))
end

def create_teacher
  print 'Teacher name: '
  name = gets.chomp
  print 'Teacher age: '
  age = gets.chomp.to_i
  print 'Teacher specialization: '
  specialization = gets.chomp
  persons.push(Teacher.new(name: name, age: age, specialization: specialization))
end

def create_book(books)
  print 'Book title: '
  title = gets.chomp.to_s
  print 'Book author: '
  author = gets.chomp.to_s
  books.push(Book.new(title: title, author: author))
  puts '** Book created successfully **'
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

def create_rental(books, people, rental)
  puts 'Select the book to rent: '
  books.each_with_index { |book, index| puts "[#{index}] - Title: #{book.title} - Author: #{book.author}" }
  book_selected = gets.chomp.to_i

  puts 'Select id of person renting the book: '
  people.each_with_index { |person, index| puts "#{index} [#{person.classroom}] Name: #{person.name}, Id: #{person.id} Age: #{person.age}" }
  person_selected = gets.chomp.to_i

  print "Date to return the book [MM/DD/YYYY]: "
  date = gets.chomp

  rentals.push(Rental.new(date: date, book: books[book_selected], person: people[person_selected]))
  puts '** Rental added successfully **'
end

def rentals_list(rentals)
  print 'Select Id of person: '
  person_id = gets.chomp.to_i

  rentals.each do |rental|
    puts "Date: #{rental.date} - Book: #{rental.book_title} by #{rental.book.author}" if rental.person.id == person_id
  end
end

def exit_app
  puts '** Exit successfully **'
end
