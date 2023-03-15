require 'io/console'
require './app'
require './show_menu'
require './process_options'

def main
  @app = App.new
  $stdout.clear_screen
  @app.load_state
  puts "\e[1m\e[36mWelcome to School Library App!\e[0m"
  loop do
    show_menu
    user_input = gets.chomp.to_i
    puts
    if user_input == 7
      @app.save_data_to_file
      puts "\e[31mThank you for using this app! ♥️"
      exit
    end
    process_options(user_input)
  end
end
main
