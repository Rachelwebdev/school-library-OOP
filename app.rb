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
end
