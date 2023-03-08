require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom:, name: 'Unknown', age: 0)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
