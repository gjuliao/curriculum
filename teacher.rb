require_relative 'person'

class Teacher < Person
  def initialize(name, age, specialization)
    super(name, age, parent_permissions)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
