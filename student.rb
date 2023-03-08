require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom:, name: 'Unknown', age: 0)
    super(name, age)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
