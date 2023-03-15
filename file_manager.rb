require 'json'

class FileManager
  def self.books_to_file(books)
    book_obj = books.map do |book|
      { title: book.title, author: book.author }
    end
    File.write('./data_files/books.json', book_obj.to_json)
  end

  def self.books_from_file(books)
    file = File.read('./data_files/books.json')
    read_books = JSON.parse(file)
    read_books.each do |book|
      books << Book.new(book['title'], book['author'])
    end
  end

  def self.people_to_file(people)
    students_obj = people.filter_map do |person|
      if person.instance_of?(::Student)
        { classname: person.class.name,
          name: person.name,
          id: person.id,
          age: person.age,
          parent_permission: person.parent_permission }
      end
    end

    teachers_obj = people.filter_map do |person|
      if person.instance_of?(::Teacher)
        { classname: person.class.name,
          specialization: person.specialization,
          name: person.name,
          id: person.id,
          age: person.age }
      end
    end

    people_obj = students_obj.concat teachers_obj
    File.write('./data_files/people.json', people_obj.to_json)
  end

  def self.people_from_file(people)
    file = File.read('./data_files/people.json')
    read_people = JSON.parse(file)
    read_people.each do |person|
      temp = if person['classname'] == 'Student'
               Student.new(age: person['age'], name: person['name'], parent_permission: person['parent_permission'],
                           classroom: person['classroom'])
             else
               Teacher.new(age: person['age'], specialization: person['specialization'], name: person['name'])
             end
      temp.id = person['id']
      people << temp
    end
  end
end
