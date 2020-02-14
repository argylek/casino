class Parent
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def use_parent_method
    puts "This was called from the parent"
  end
end

class Child < Parent
  def initialize(name, school)
    super(name)
    @school = school
  end
  def use_parent_method
    puts 'Love ya mom'
  end
end

parent = Parent.new ('kyle')
child = Child.new('Steve', 'North')

parent.use_parent_method
child.use_parent_method

p parent.name
p child.name
