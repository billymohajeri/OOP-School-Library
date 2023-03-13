require 'io/console'
require './app'
require './show_menu'
require './process_options'

def main
  @app = App.new
  $stdout.clear_screen
  puts 'Welcome to School Library App!'
  loop do
    show_menu
    user_input = gets.chomp.to_i
    if user_input == 7
      puts 'Thank you for using this app!'
      break
    end
    process_options(user_input)
  end
end
main
