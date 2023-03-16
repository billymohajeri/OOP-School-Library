require_relative '../classroom'
require_relative '../student'
require_relative '../person'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Label')
  end

  context 'when creating the classroom class' do
    it 'creates a classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it 'adds student to classroom' do
      new_student = Student.new(classroom: '', age: 12)
      @classroom.add_student(new_student)
      expect(@classroom.students).not_to be_empty
    end
  end
end
