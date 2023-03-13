require_relative './app'

def main
  puts 'Welcome to the school library applicaiton'
  books = []
  people = []
  rentals = []

  options(books, people, rentals)
end

def display_list
  puts 'Please input number from the list:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for given person
  7 - Exit
  '
end

def options(books, people, rentals) # rubocop:disable Metrics/MethodLength: Method has too many lines
  loop do
    display_list
    option = gets.chomp.to_i
    case option
    when 1
      list_all_books(books)
    when 2
      list_all_persons(people)
    when 3
      create_person(people)
    when 4
      create_book(books)
    when 5
      create_rental(books, people, rentals)
    when 6
      rentals_list(rentals)
    else
      exit_app
      break
    end
  end
end

main
