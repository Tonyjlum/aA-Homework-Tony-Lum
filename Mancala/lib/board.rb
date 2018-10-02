require "byebug"
class Board
  attr_accessor :cups, :current_player, :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
    @name1 = name1
    @name2 = name2

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each do |el|
    el << :stone until el.length == 4
    end
    cups[6] = []
    cups[13] = []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos == 6
    raise "Starting cup is empty" if cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      gems = cups[start_pos]
      cups[start_pos] = []
      i = start_pos + 1
      last = nil
      until gems.empty?

        if i == 6 && current_player_name == @name1
          cups[i] << gems.shift
          last = i if gems.empty?
          i += 1
        elsif i == 6
          i +=1
        end

        if i == 13 && current_player_name == name2
          cups[i] << gems.shift
          last = i if gems.empty?
          i += 1
        elsif i == 13
          i += 1
        end


        i = 0 if i >= 13
        cups[i] << gems.shift
        last = i if gems.empty?
        i += 1

      end

    end

    render
    next_turn(last)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    debugger
    if ending_cup_idx == 6 or ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length > 1
      :switch
    else
    ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} ||
    @cups[7..12].all? {|cup| cup.empty?}

  end

  def winner
    p1count = @cups[6].length
    p2count = @cups[13].length

  case p1count <=> p2count
  when 1
    @name1
  when -1
    @name2
  when 0
    :draw
  end

  end
end
