require_relative 'person_class'

class Teacher < Person
  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end
end
