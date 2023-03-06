require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, _classroomm, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
