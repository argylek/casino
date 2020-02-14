class Parent
  attr_reader :name
  def initialize(name)
    @name = name
  end
  def from_parent
    puts "this method was defined in parent class"
  end
  def say_hello
    puts 'hi'
  end
  def say_hello1
    puts 'super hi!'
  end
end
class Child < Parent
  attr_reader :school
  def initialize(name, school)
    super(name)
    @school = school
  end
  def say_hello
    puts 'hi I am a child'
  end
  def say_hello1
    super()
    puts 'Extra'
  end
end
parent = Parent.new('Mom')
child = Child.new('Son', 'school')
p parent.name
p child.name
p child.school
p child.say_hello1