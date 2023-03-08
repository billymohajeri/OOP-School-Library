require './rental'

class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, person, self)
    @rental.push(rental)
  end
end
