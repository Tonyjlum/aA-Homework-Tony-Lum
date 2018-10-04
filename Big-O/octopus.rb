FISHS = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# O(n^2) Quadratic Equation
def sluggish_octopus(arr = FISHS)
  arr.each do |first_fish|
    largest = true
    arr.each do |second_fish|
      largest = false if second_fish.length > first_fish.length
    end
    return first_fish if largest
  end
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |a,b| a<=>b }

    return self if self.length <= 1

    mid = self.length / 2
    sorted_left = self[0...mid].merge_sort(&prc)
    sorted_right = self[mid..-1].merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    results = []

    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        results << left.shift
      when 0
        results << left.shift
      when 1
        results << right.shift
      end
    end
    results + left + right
  end
end

# O(n log n) Log Linear
def dominant_octopus(arr = FISHS)
  prc = Proc.new { |a,b| b.length <=> a.length }
  arr.merge_sort(&prc).first
end

# O(n) Linear algorithm
def clever_octopus(arr = FISHS)
  largest = arr.first

  arr.each { |fish| largest = fish if fish.lenght > largest.length }

  largest
end

class DancingOctopus
  MOVESARR = ["up", "right-up", "right", "right-down"
    "down", "left-down" "left", "left-up"]

  MOVESHSH = {
    "up" => 0, "right-up" => 1, "right" => 2, "right-down" =>3,
    "down" => 4, "left-down" =>5, "left" => 6, "left-up" =>7
  }
  #Array search, goes to each one until it finds something
  def slow_dance(direction, tiles_array = MOVESARR)
    tiles_array.each.with_index do |move, idx|
      return idx if direction == move
    end
  end
  #Hash search, will just call the hash for the direction key.
  def fast_dance(direction, new_tiles_data_structure = MOVESHSH)
    new_tiles_data_structure[direction]
  end

end
