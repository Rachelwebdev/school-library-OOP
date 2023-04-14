require_relative 'app'

def main
    Main.new
end

class Main
    puts 'Welcome to School Library OOP App!'
    def self.menu
        puts
        puts 'Please choose an option by entering a number'
        @list = {
          1 => 'List all books',
          2 => 'List all people',
          3 => 'Create a person',
          4 => 'Create a book',
          5 => 'Create a rental',
          6 => 'List all rentals for a given person id',
          7 => 'Exit'  
        }
        @list.each do |id, option|
      puts "#{id}: #{option}"
    end
    gets.chomp.to_i
  end
   
end