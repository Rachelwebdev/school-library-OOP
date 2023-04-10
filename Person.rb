require_relative 'student'
require_relative 'teacher'

class Person 

    attr_reader :id, :name, :age, :parent_permission

    def initialize(name = "Unknown", age, parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def name=(name)
        @name = name
    end

    def age=(age)
        @age = age
    end

    def can_use_services?
        is_of_age? || @parent_permission
    end

    private

    def is_of_age? 
        @age >= 18
    end

end