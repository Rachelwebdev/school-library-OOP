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

    def create_rental
    if @books.empty?
      puts 'Book array is empty'
    elsif @people.empty?
      puts 'Person array is empty'
    else
      rental_book = select_book
      rental_person = select_person
      date = the_rental_date

      rental = Rental.new(date, @people[rental_person], @books[rental_book])

      @rentals << rental
      puts 'Rental created successfully'
    end
  end

  def select_book
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    gets.chomp.to_i
  end

  def select_person
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def the_rental_date
    print 'Enter rental date: '
    gets.chomp
  end

  def list_rentals_of_person
    if @rentals.empty?
      puts 'Rental is empty'
    else
      print 'Enter ID of person: '
      person_id = gets.chomp.to_i

      rentals_found = false

      @rentals.each do |rental|
        next unless rental.person.id == person_id

        rentals_found = true
        puts 'Rentals:'
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end

      puts 'No rentals found for the given person' unless rentals_found
    end
  end
end
