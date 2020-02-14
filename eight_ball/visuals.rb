class Visuals
  def initialize
  end
  def seperator
    puts '*' * 10
  end
  def full_menu
    seperator
    puts "select an option"
    puts "1) add something to the 8 Ball"
    puts "2) show the list of phrases in the 8 Ball"
    puts "3) reset the list of phrases"
    puts "4) exit"
  end
end