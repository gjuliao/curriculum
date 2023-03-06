# encoding: utf-8
require_relative 'person_class.rb'
class Student < Person
    def initialize name, age, parent_permission, classroom
      super(name, age, parent_permission)
      @classroom = classroom
    end
    def play_hooky
      p "¯\(ツ)/¯"
    end
end

