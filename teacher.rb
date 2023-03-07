require_relative 'person'

class Teacher < Person
  def initialize(name, age, specialization)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new 'gio', 25, 'blogger'
p teacher1