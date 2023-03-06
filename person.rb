class Person
    def initialize(name = "Unknown", age, parent_permission = true)
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end

    attr_reader :id
    attr_accessor :age, :name
    
    def can_use_services?
      is_of_age? || @parent_permission 
    end

    private

    def is_of_age?
      @age >= 18
    end
end


# Project requirements
# Create class Person with the following:
# Instance vars: @id, @name, and @age.
# Constructor with name, age, and parent_permission as parameter. name and parent_permission are optional and 
# have default values of "Unknown" and true.
# Getters for @id, @name, and @age.
# Setters for @name and @age.
# Private method is_of_age? that returns true if @age is greater or equal to 18 and false otherwise.
# Public method can_use_services? that returns true if person is of age or if they have permission from parents.
# Create class Student with the following:
# Inherits from Person.
# Constructor extends parent's constructor by adding @classroom and a parameter for it.
# Method play_hooky that returns "¯\(ツ)/¯".
# Create class Teacher with the following:
# Inherits from Person.
# Constructor extends parent's constructor by adding @specialization and a parameter for it.
# Override can_use_services? so it always returns true.
# Each class should be saved in a separate file.

