require_relative 'person_class.rb'
class Teacher < Person
    def initialize name, age, specialization
        super(name, age)
        @specialization = specialization
    end
    def can_use_service?
        super
    end
end
