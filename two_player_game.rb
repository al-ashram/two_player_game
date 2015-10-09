class InvalidGuessError < StandardError

end


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
    ask_names
    start_game 
  end

  def ask_names
    @players_array.each do |player|
      puts "Player #{player.id} please enter your name"
      @name = gets.chomp
      puts "\n"

      #if input is empty
      while @name == ""
        begin
          raise "name can't be empty!!"
        rescue
          puts "Please re-enter name!!" 
          @name = gets.chomp
          puts "\n" 
        end
      end

      player.name = @name
    end
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
        generate_question(player.name)
        check_answer(player)
        display_full_results
        if game_over?(player)
          puts "GAME OVER!!!!"
          exit 
        end
      end
    end
  end

  def generate_question(player_name)
    @first_number = ((1..20).to_a).sample
    @second_number = ((1..20).to_a).sample
    puts "#{player_name}! What is #{@first_number} + #{@second_number}?"
  end

  def check_answer(player)
    @answer = gets.chomp
    exit if @answer == 'quit'
     
    #while input is a string  
    while @answer.to_i.to_s != @answer
      begin
        raise InvalidGuessError, "must be a number!!!"
      rescue
        puts "Please enter a number!!" 
        @answer = gets.chomp
      end
    end

    if @answer.to_i == @first_number + @second_number
      puts "correct!"
      player.gain_a_point
    else
      puts "wrong!"
      player.lose_a_life
    end
      
  end

  def display_full_results
    @players_array.each do |player|
        puts "#{player.name}: score #{player.score} , health #{player.health}"
    end
    puts "\n"
  end

  def game_over?(player)
    player.health == 0 
  end

end

new_game = Game.new

