class Player

attr_reader :score, :health, :id
attr_accessor :name

  def initialize(id)
    @name = "default"
    @score = 0
    @health = 3
    @id = id
  end

  def gain_a_point
    @score += 1
  end

  def lose_a_life
    @health -= 1
  end
end


class Game

  def initialize
    puts "Welcome to a new game! Enter 'quit' to exit"
    initialize_players
    start_game 
  end

  def initialize_players
    player1 = Player.new(1)
    player2 = Player.new(2)
    
    @players_array = Array.new
    @players_array << player1
    @players_array << player2
  end

  def start_game 
    loop do
      @players_array.each do |player|
        generate_question(player.id)
        check_answer(player)
        display_full_results
        if game_over?(player)
          puts "GAME OVER!!!!"
          exit 
        end
      end
    end
  end

  def generate_question(player_number)
    @first_number = ((1..20).to_a).sample
    @second_number = ((1..20).to_a).sample
    puts "Player #{player_number}: #{@first_number} + #{@second_number}?"
  end

  def check_answer(player)
    @answer = gets.chomp
    if @answer.downcase == 'quit'
      exit
    elsif @answer.to_i == @first_number + @second_number
      puts "correct!"
      player.gain_a_point
    else
      puts "wrong!"
      player.lose_a_life
    end
  end

  def display_full_results
    @players_array.each do |player|
        puts "Player #{player.id} | score #{player.score} | health #{player.health}"
    end
    puts "\n"
  end

  def game_over?(player)
    player.health == 0 
  end

end

new_game = Game.new