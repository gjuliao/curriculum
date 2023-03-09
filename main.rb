class Menu
    def initialize 
        @app = App.new
        @app = App.new(self)
        @options = [
            { id: 1, option: 'list_all_books', menu_item: 'list all books' },
            { id: 2, option: 'list_all_persons', menu_item: 'list all persons' },
            { id: 3, option: 'create_person', menu_item: 'create person' },
            { id: 4, option: 'create_book', menu_item: 'create book' },
            { id: 5, option: 'create_rental', menu_item: 'Create Rental' },
            { id: 6, option: 'rentals_to_person', menu_item: 'list all rentals of given person' },
            { id: 7, option: 'exit_app', menu_item: 'exit app' }
        ]
    end

    def show_options
        $stdout.clear_screen
        puts 'Please just press option number: '
        @options.each do |option|
            puts "[#{option[:id]}] - #{option[:menu_item]}"
        end
        user_input = $stdin.getch
        do_option(user_input)
    end
end