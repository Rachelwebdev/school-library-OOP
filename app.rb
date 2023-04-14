require_relative 'person'
require_relative 'nameable'
require_relative 'book'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'
require_relative 'student'
# require 'pry'

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
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    number = gets.chomp.to_i
    if number == 1
      create_student
    elsif number == 2
      create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp

    each_student = Student.new(age, name, parent_permission)
    @people << each_student
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    each_teacher = Teacher.new(age, specialization, name)
    @people << each_teacher
    puts 'Person created successfully'
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

      rental = Rental.new(date, @books[rental_book], @people[rental_person])

      @rentals << rental
      puts 'Rental created successfully'
    end
  end

  def select_book
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index} Title: \"#{book.title}\", Author: #{book.author}"
    end
    gets.chomp.to_i
  end

  def select_person
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts "#{index} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
