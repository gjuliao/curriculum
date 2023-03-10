require './person'

class Student < Person
  attr_reader :classroom, :rentals

  def initialize(classroom:, age:, parent_permission: true, name: 'Unknown')
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
    @rentals = []
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
