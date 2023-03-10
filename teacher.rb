require './person'

class Teacher < Person
  attr_reader :rentals

  def initialize(age:, specialization:, name: 'Unknown')
    super(name: name, age: age)
    @specialization = specialization
    @rentals = []
  end

  def can_use_services?
    true
  end
end
