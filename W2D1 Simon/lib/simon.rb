class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    #color stay for lest time on the screen as game progess.
    @sleeptimer = 0.75
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn

    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sleeptimer -= 0.02
      @sequence_length +=1
    end


  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color

      sleep @sleeptimer
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end

  end

  def add_random_color
    seq << COLORS.sample
    seq

  end

  def round_success_message
    "You got it!"
  end

  def game_over_message
    "You cannot win this game, only lose =["

  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []

  end
end
