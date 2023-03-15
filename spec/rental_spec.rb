require_relative '../person'
require_relative '../book'

describe Rental do
  before(:each) do
    @person = Person.new(age: 18, name: 'Sophia')
    @book = Book.new('book', 'bill')
  end

  context 'when testing the rental class' do
    it 'Create rental with both person & book' do
      rental = Rental.new('2018/01/10', @person, @book)
      expect(rental.book).to be(@book)
      expect(@book.rental.first).to be(rental)
      expect(rental.person).to be(@person)
      expect(@person.rental.first).to be(rental)
    end
  end
end
