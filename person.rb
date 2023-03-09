require_relative 'nameable'
class Person < lsnameable
  attr_reader :id
  attr_accessor :name, :age, :rental

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_service?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
