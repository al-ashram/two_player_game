#this is OOP version
class Game

def initialize
puts "Welcome to a new game!"
@score = {"Player 1" => 3, "Player 2" =>3}

  for i in 0..Float::INFINITY 
    player_tracker(i)
    generate_question(@player_number)
    prompt_player_for_answer
    verify_answer
    game_over?(@score["Player #{@player_number}"])
    break if @answer == "quit"
    break if @over == true
  end
end


def generate_question(player_number)
@first_number = ((1..20).to_a).sample
@second_number = ((1..20).to_a).sample

puts "Player #{player_number}: What does #{@first_number} plus #{@second_number} equal?"
end

def prompt_player_for_answer
@answer = gets.chomp
end

def verify_answer
  if @answer.to_i == @first_number + @second_number
    puts "correct!"
  else
    @score["Player #{@player_number}"] -= 1
    print "Current Score is: "
    @score.each do |player, score|
      print "#{player} =>#{score} " 
    end
    print "\n"
  end
end

def player_tracker(round_number)
  @player_number = round_number%2 + 1
end

def game_over?(score)
    score == 0 ? @over = true : @over = false
end

end

new_game = Game.new


