class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(name = 'Unknown', age = 0, parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_service?
    is_of_age? || parent_permission ? true : false
  end

  private

  def is_of_age?(age)
    age >= 18
  end
end

person1 = Person.new 'gio', 21, true
person1.can_use_service?
