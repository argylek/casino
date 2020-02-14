class Dog
  attr_accessor :name, :breed
  def initialize(name, breed)
    @name = name
    @breed = breed
  end
  def say_hello
    puts "my name is #{@name}, I'm a #{@breed}"
  end
  def self.bark
    puts 'Bork, Bork'
  end
  private 
  def my_secret
    return 'secret'
  end

end

dog = Dog.new('Steve', 'Huskey')
dog1 = Dog.new('Kyle', 'Schnowzer')
dog2 = Dog.new('Jaz', 'Chiuahua')
dog3 = Dog.new('Freya', 'Corgi')
dog4 = Dog.new('Blair', 'Newfoundland')
dog5 = Dog.new('Rover', 'Lab')

dog_array = [dog, dog1, dog2, dog3, dog4, dog5]
dog_array.each do |dog|
  p dog.name
end

puts dog.name
dog.say_hello

dog.my_secret

