require_relative 'visuals'

class Answers

  attr_accessor :answer_array

  def initialize
    @array_backup = []

    @answer_array = [
      "It is certain.",
      "It is decidedly so.",
      "Without a doubt.",
      "Yes - definitely.",
      "You may rely on it.",
      "As I see it, yes.",
      "Most likely.",
      "Outlook good.",
      "Yes.",
      "Signs point to yes.",
      "Reply hazy, try again.",
      "Ask again later.",
      "Better not tell you now.",
      "Cannot predict now.",
      "Concentrate and ask again.",
      "Don't count on it.",
      "My reply is no.",
      "My sources say no.",
      "Outlook not so good.",
      "Very doubtful."
      ]
      @array_backup = answer_array.clone
  end

  def seperator
    puts '*' * 10
  end
  
    
  def show_answers
    seperator
    @answer_array.each do |x|
      puts x
    end
    seperator
  end

  def get_random_answer
    puts @answer_array.sample
  end

  def reset_answers
    @answer_array = @array_backup
    seperator
    puts "the answer list has been reset!"
    seperator
  end
end

# answers = Answers.new
# answers.add_answers
# answers.show_answers
# answers.add_answers
# answers.show_answers