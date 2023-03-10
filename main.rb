require 'io/console'
require './app'

def show_menu
  puts "\nPlease choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person id
7 - Exit"
end

def process_options(usr_inp)
  case usr_inp
  when '1'
    @app.list_all_books
  when '2'
    @app.list_all_people
  when '3'
    @app.create_person
  when '4'
    @app.create_book
  when '5'
    @app.create_rental
  when '6'
    @app.list_rentals
  else
    exit
  end
end

def main
  @app = App.new
  $stdout.clear_screen
  puts 'Welcome to School Library App!'
  loop do
    show_menu
    user_input = gets.chomp
    if user_input == '7'
      puts 'Thank you for using this app!'
      break
    end
    process_options(user_input)
  end
end
main
