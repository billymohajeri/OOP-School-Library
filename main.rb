# In your main.rb define the entry point, this will be a method called main that is invoked at the end of your file.
#  This method should do the following:
#     Present the user with a list of options to perform.
#     Lets users choose an option.
#     If needed, ask for parameters for the option.
#     Have a way to quit the app.

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
    puts '3'
  when '4'
    @app.create_book
  when '5'
    puts '5'
  when '6'
    puts '6'
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
