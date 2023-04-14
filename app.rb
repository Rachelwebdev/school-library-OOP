require_relative 'person'
require_relative 'nameable'
require_relative 'book'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'
require_relative 'student'

class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end

    def all_books
        if @books.empty? 
            'There are no books'
        else
            @books.each do |each_book|
                puts "Title: \"#{each_book.title}\", Author: \"#{each_book.author}\""
            end
        end
    end

    def all_people 
        if @people.empty?
            'There are no people'
        else
            @people.each do |each_person|
                puts "Name: #{each_person.name}, ID: #{each_person.id}, Age: #{each_person.age}"
            end
        end
    end

    def create_person 
        person_type = person_type_switch
        return if person_type.nil?

        print 'Name: '
        name = gets.chomp
        print 'Age: '
        age = gets.chomp.to_i
        person = 
        case person_type
        when '1'
            print 'classroom: '
            classroom = gets.chomp
            print 'Has parent permission? [Y/N]: '
            parent_permission = gets.chomp
            parent_permission = parent_permission.downcase == 'y'
            classroom = Classsroom.new(classroom)
            Student.new(classroom, age, name, parent_permission: parent_permission)
        when '2'
            print 'Specialization: '
            Specialization = gets.chomp

            Teacher.new(age, specialization, name)
        end

        @people << person
        puts 'Person created successfully'
    end

    def person_type_switch
        print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
        person_type = gets.chomp
        if person_type != '1' && person_type ! = '2'
            puts 'Invalid option'
            return
        end
        person_type
    end

    def create_book 
        print 'Title: '
        title = gets.chomp
        print 'Author: '
        author = gets.chomp

        each_book = Book.new(title, author)
        @books << each_book
        puts 'Book created successfully'
    end
end
