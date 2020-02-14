require_relative 'answers'
require_relative 'magic_eight_ball'
require_relative 'visuals'
require 'colorize'
@answers = Answers.new
@magic = Magic.new
@visuals = Visuals.new

def app
  puts "Type a question, or type 'MENU' for menu and 'QUIT' to leave"
  user_question = gets.chomp.to_s
  quit = "quit"
  add = 'add_answers'
  show = 'show_answers'
  reset = 'reset_answers'
  menu = 'menu'
    if user_question.downcase == quit
        # User inputs "QUIT"
        puts "Thanks for playing! Goodbye.".colorize(:red)
        # Computer outputs a goodbye message and exits
        exit
    elsif user_question.downcase == add
      # Via easter egg question ("add_answers")
        add_answers
    elsif user_question.downcase == show
        @answers.show_answers
        # Ability to have eight ball print all answers
        # Via easter egg question ("print_answers") 
    elsif user_question.downcase == reset
      @answers.reset_answers
      # Via easter egg question ("reset_answers")
    elsif user_question.downcase == menu
      @visuals.full_menu
      user_menu = gets.chomp.to_i
      case user_menu 
        when 1
          add_answers
        when 2
          @answers.show_answers
        when 3
          @answers.reset_answers
        when 4
          exit
        else
          puts "Really wanted to go off script here, huh?".colorize(:purple)
        end
    else
        @magic.eight_ball(user_question)
    end
    app
end
# Bonus Objectives:

# Create a menu to handle all the functionality.
# Use classes to handle the Eight Ball Program and Answers.
# Use the colorize gem (from lecture) to add some color to your application.


def add_answers
  @visuals.seperator
  # Ability to add more answers:
  puts "Add a new Answer to the list!"
  user_input = gets.chomp.to_s
  already_there = @answers.answer_array.include? user_input
  if already_there
    @visuals.seperator
    puts "thats already in there"
    @visuals.seperator
     # Do not let them add the same answer if the eight ball already has that answer
  else
    @visuals.seperator
    @answers.answer_array.push(user_input)
    puts "'#{user_input}' has been added to the 8 Ball"
    @visuals.seperator
  end
end

app
