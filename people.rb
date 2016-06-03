# class Parent
#   attr_accessor :name
#
# def walk
#   "#{@name} is walking to school"
# end
#
# parent1 = Parent.new
# parent1 = "John"
# p parent1.name
# p parent1.walk


class Student
 def learn
   puts "I get it!"
 end
end


class Instructor
  def teach
    puts "Everything in Ruby is an Object"
  end
end

ellie = Student.new
p ellie.learn
