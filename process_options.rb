require './app'

def process_options(usr_inp)
  case usr_inp
  when 1
    @app.list_all_books
  when 2
    @app.list_all_people
  when 3
    @app.create_person
  when 4
    @app.create_book
  when 5
    @app.create_rental
  when 6
    @app.list_rentals
  else
    puts "\e[31mInvalid selectin! please try again."
  end
end
