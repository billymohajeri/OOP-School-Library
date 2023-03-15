require_relative '../classroom'
require_relative '../student'

describe Student do
  before :each do
    @classroom = Classroom.new('one')
    @student = Student.new(age: 19, classroom: @classroom)
  end

  context 'When testing the student class' do
    it 'Should create an instance of the class' do
      expect(@student).to be_an_instance_of Student
    end
  end
end
