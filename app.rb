require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

def list_all_books(books)
  if books[0]
    books.each { |book| puts "Book: #{book.title} - Author: #{book.author}" }
  else
    puts 'Library is empty'
  end
end

def list_all_persons(person)
  if person[0]
    person.each { |person| puts "[#{person.class}] Id: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  else
    puts 'No persons included so far, please add a person'
  end
end

def create_person(person)
  print 'What do you want to create, press [1] for Student or [2] for Teacher: '
  choice = gets.chomp.to_i
  case choice
  when 1
    create_student(person)
  when 2
    create_teacher(person)
  else
    create_person(person)
  end

  puts '** Person created successfully **'
end

def create_student(person)
  print 'Student name: '
  name = gets.chomp
  print 'Student age: '
  age = gets.chomp.to_i
  print 'Student has parent permission [Y/N]: '
  parent_permission = gets.chomp.to_s.downcase
  print 'Student classroom: '
  classroom = gets.chomp
  person.push(Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom))
end

def create_teacher(person)
  print 'Teacher name: '
  name = gets.chomp
  print 'Teacher age: '
  age = gets.chomp.to_i
  print 'Teacher specialization: '
  specialization = gets.chomp
  person.push(Teacher.new(age: age, specialization: specialization, name: name))
end

def create_book(books)
  print 'Book title: '
  title = gets.chomp.to_s
  print 'Book author: '
  author = gets.chomp.to_s
  books.push(Book.new(title: title, author: author))
  puts '** Book created successfully **'
end

def create_rental(books, people, rentals)
  puts 'Select the book to rent: '
  books.each_with_index { |book, index| puts "[#{index}] - Title: #{book.title} - Author: #{book.author}" }
  book_selected = gets.chomp.to_i

  puts 'Select index of person renting the book: '
  people.each_with_index do |person, index|
    puts "Index: #{index} [#{person.class}] Name: #{person.name}, Id: #{person.id} Age: #{person.age}"
  end
  person_selected = gets.chomp.to_i

  print 'Date to return the book [MM/DD/YYYY]: '
  date = gets.chomp

  rentals.push(Rental.new(date: date, person: people[person_selected], book: books[book_selected]))

  puts '** Rental added successfully **'
end

def rentals_list(rentals)
  print 'Select Id of person: '
  person_id = gets.chomp.to_i

  rentals.each do |rental|
    puts "Date: #{rental.date} - Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
  end
end

def exit_app
  puts '** Exit successfully **'
end
