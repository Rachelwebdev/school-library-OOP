require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'rental'

person = Person.new(age: 22, name: 'maximilianus')
p person.correct_name
p capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
p capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
