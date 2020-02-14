require_relative 'answers'
require 'colorize'

#magic 8 ball class
class Magic
  attr_accessor :user_question

  def initialize
    user_question = user_question
    @answers = Answers.new
  end
  # @answers = Answers.new
# User inputs question

def eight_ball(user_question)
    puts "Asking The Magic Eight Ball '#{user_question}' and it says......."
    # Computer outputs random answer
    puts @answers.get_random_answer.to_s
    again 
end

def again
  puts "Would you like to play it again? y or n?".colorize(:blue)
  again = gets.chomp.to_s
  yes = 'y'
  no = 'n'
  if again.downcase == yes
  elsif again.downcase == no
    puts "Thanks for Playing!".colorize(:red)
    exit
  else
    puts "invalid Response".colorize(:red)
  end
end

end
