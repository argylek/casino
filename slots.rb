
def random_answer
  puts "#{@row1} #{@row2} #{@row3}"
end
# if user gets the 3 rows with same number, user wins.
# if not, user looses and he can choose to play again or exit.


@row1 = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6"
].sample

@row2 = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6"
].sample

@row3 = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6"
].sample

def prompt
  puts "Welcome to the Slots game! Do you feel lucky today? Ler's play"
  puts
  puts "How much would you like to bet?"
  question_and_answer
  @bet = gets.to_i
end

def question_and_answer
  puts "Spine the Slots!"
  puts
  puts random_answer
  puts
prompt
end

puts random_answer

def slot_outcome
  case outcomes
  when @row1 == @row2 && @row2 == @row3
    triple_money
  when @row1 == @row2 || @row2 == @row3 || @row1 == @row3
    double_money
  else
    puts "Sorry, you lost! Goodluck next time!"
  end
end 

def triple_money
  @bet * 3
end

def double_money
@bet * 2
end


# exit or play again if they win or loose!
# 