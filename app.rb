require './book'
require './student'
require './teacher'
require './file_manager'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'There is no books in the list...'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There is no people in the list...'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case choice
    when 1
      print 'Has parent permission? [Y/N]: '
      input_permission = gets.chomp.capitalize
      student_permission = true if input_permission == 'Y'
      student_permission = false if input_permission == 'N'
      @people.push(Student.new(age: age, name: name, parent_permission: student_permission, classroom: @classroom))

    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(age: age, specialization: specialization, name: name))
    end
    puts 'Person created sccessfully.'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_id = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    if @rentals.empty?
      puts 'There is no rental for this person...'
    else
      @rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
      end
    end
  end

  def save_data_to_file
    FileManager.books_to_file(@books)
    FileManager.people_to_file(@people)
    FileManager.rentals_to_file(@rentals)
  end

  def load_state
    FileManager.books_from_file(@books)
    FileManager.people_from_file(@people)
    FileManager.rentals_from_file(@rentals, @books, @people)
  end
end
