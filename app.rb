# Create a app.rb file that will serve as your console app entry-point. It should have methods that do the following:
#     List all books.
#     List all people.
#     Create a person (teacher or student, not a plain Person).
#     Create a book.
#     Create a rental.
#     List all rentals for a given person id.
require './book'
require './student'
require './teacher'

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
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age #{person.age}" }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case choice
    when '1'
      print 'Has parent permission? [Y/N]: '
      input_permission = gets.chomp.capitalize
      student_permission = true if input_permission == 'Y'
      student_permission = false if input_permission == 'N'
      @people.push(Student.new(age: age, name: name, parent_permission: student_permission, classroom: @classroom))

    when '2'
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
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental; end

  def list_rentals; end
end
