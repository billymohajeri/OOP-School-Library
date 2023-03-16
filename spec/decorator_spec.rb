require_relative '../person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new(age: 18, name: 'billymohajeri')
  end

  context 'CapitalizeDecorator' do
    it 'capitalize first letter of name' do
      capitalize = CapitalizeDecorator.new(@person)
      expect(capitalize.correct_name).to eql('Billymohajeri')
    end
  end
  context 'TrimmerDecorator' do
    it 'trims name to 10 characters' do
      trim = TrimmerDecorator.new(@person)
      expect(trim.correct_name).to eql('billymohaj')
      expect(trim.correct_name.length).to be <= 10
    end
  end
end
