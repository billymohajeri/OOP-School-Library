require_relative '../book'
require_relative '../person'

describe Book do
  before :each do
    @book = Book.new('newTitle', 'newAuthor')
    @person = Person.new(age: 13)
  end

  context 'Creating a book' do
    it 'Should create an instance of the book' do
      expect(@book).to be_an_instance_of Book
    end

    it 'Should return title and author' do
      expect @book.title.should eq 'newTitle'
      expect @book.author.should eq 'newAuthor'
    end

    it 'Book has rental' do
      @book.add_rental(@person, '01/09/2022')
      expect(@book.rental).not_to be_empty
    end
  end
end
