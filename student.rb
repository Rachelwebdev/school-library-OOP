require_relative 'Person'

class Student < Person
    attr_accessor :classroom

    def initialize(age, classroom, name = "Unknown", parent_permission = true)
        super(age, name, parent_permission)
        @classroom = classroom
    end
    def play_hooky
        "¯\\_(ツ)_/¯"
    end
end
