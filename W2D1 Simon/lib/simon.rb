class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play

  end

  def take_turn
    require_sequence
    show_sequence

  end

  def show_sequence

  end

  def require_sequence
    
  end

  def add_random_color
    colors = ["red", "blue", "yellow", "green"]
    seq << colors.sample

  end

  def round_success_message

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
