class Person
  # attr_accessor :name
  def initialize(name)
  @name = name
  end
  def greeting
    "Hi, my name is #{@name}."
  end
end


class Student < Person
 def learn
   puts "I get it!"
 end
end


class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

chris = Instructor.new("Chris")
p chris.greeting
p chris.teach
ellie = Student.new("Ellie")
p ellie.learn
p ellie.greeting

#The following commands don't work.  This is because while both the student and
#instructor inherit from the People class, the student doesn't inherit anything
#from the instructor class, and the instructor doesn't inherit anything from
#the student class.
p chris.learn
p ellie.teach
